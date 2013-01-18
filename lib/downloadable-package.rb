module DownloadablePackage
  def self.included(base) 
    base.extend DownloadablePackage
    base.property :url,   required: true
    base.property :tarfile do
      "#{working_dir}/#{name}-#{version}.tar.gz"
    end
  end
  
  def do_fetch
    self.do_download
    self.do_unpack
  end
  
  def do_download
    self.announce "Downloading #{name}-#{version} from '#{self.url}'"
    self.cmd "pwd"
    self.cmd "curl -s -D- -o '#{self.tarfile}'  '#{self.url}'"
  end
  
  def do_unpack
    self.announce "Unpacking tarball '#{self.tarfile}'"
    self.cmd "tar -xzf '#{self.tarfile}'"
  end
  
  def source_dir
    @source_dir ||= detect_source_dir
  end

  def detect_source_dir
    if @dry_run
      return '#{source_dir}'
    end
    output = `tar -tzf #{self.tarfile} | cut -d/ -f1 | uniq`.split('\n')
    if output.length > 1
      raise "Error: tarfile #{self.tarfile} has #{output.length} top-level entries"
    end
    return "#{working_dir}/#{output[0]}".strip
  end
end
