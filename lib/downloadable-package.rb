module DownloadablePackage
  def self.included(base)
    base.extend DownloadablePackage
    base.property :url,   required: true
    base.property :tarfile do
      "#{working_dir}/#{File.basename(self.url)}"
    end
  end

  def do_fetch
    self.do_download
    self.do_unpack
  end

  def do_download
    self.announce "Downloading #{name}-#{version} from '#{self.url}'"
    self.cmd "pwd"
    self.download(self.url, self.tarfile)
  end

  def tar_z_or_j
    if self.tarfile.match /[.]bz2$/
      'j'
    else
      'z'
    end
  end

  def do_unpack
    self.announce "Unpacking tarball '#{self.tarfile}'"
    if self.tarfile.match /[.]zip$/
      self.cmd "unzip '#{self.tarfile}'"
    else
      self.cmd "tar -x#{self.tar_z_or_j}f '#{self.tarfile}'"
    end
  end

  def source_dir
    @source_dir ||= detect_source_dir
  end

  def detect_source_dir
    if @dry_run
      return '#{source_dir}'
    end
    if self.tarfile.match /[.]zip$/
      output = `unzip -t #{self.tarfile} | perl -ne 's/^\s*testing: // and print' | cut -d/ -f1 | uniq`.split('\n')
      puts "OUTPUT='#{output}'"
    else
      output = `tar -t#{self.tar_z_or_j}f #{self.tarfile} | cut -d/ -f1 | uniq`.split('\n')
    end
    if output.length > 1
      raise "Error: tarfile #{self.tarfile} has #{output.length} top-level entries"
    end
    return "#{working_dir}/#{output[0]}".strip
  end
end
