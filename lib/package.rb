#!/usr/bin/env ruby

class Package
  def initialize
    #@dry_run = true
  end

  def name
    raise 'This must be defined'
  end

  def version
    raise 'This must be defined'
  end

  def url
    raise 'This must be defined'
  end

  def description
    raise 'This must be defined'
  end

  def arch
    ARCH
  end

  def build_depends
    nil
  end

  def depends
    []
  end

  def provides
    [self.name, "#{PACKAGING_PREFIX}#{self.name}"]
  end

  def replaces
    [self.name]
  end

  def install_prefix
    '/usr/local'
  end

  def wdversion
    version # this is a hack so for packages w/o a specified version
  end

  def working_dir
    @working_dir ||= Dir.mktmpdir ['', "-#{name}-#{wdversion}"], "#{BASE_DIRECTORY}/tmp"
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

  def tarfile
    "#{working_dir}/#{name}-#{version}.tar.gz"
  end

  def debfile
    "#{self.working_dir}/#{PACKAGING_PREFIX}#{name}-#{version}-#{arch}.deb"
  end

  def install_root
    "#{working_dir}/install-root"
  end

  def announce(msg)
    puts "\033[32;m#{msg}\033[39;m"
  end

  def cmd(cmd, dir = self.working_dir)
    cmd="cd #{dir}\n#{cmd}"
    puts "\033[33;m#{cmd}\033[39;m"
    unless @dry_run
      sh cmd
    end
  end

  def do_all
    self.do_deps
    self.do_fetch
    self.do_build
    self.do_package
    self.do_copy
  end

  def do_deps
    if self.build_depends
      self.announce "Ensuring that all the build dependencies are installed - {#{self.build_depends.join(', ')}}"
      self.cmd "sudo apt-get -y install #{self.build_depends.join(' ')}"
    end
  end

  def do_fetch
    self.announce "Downloading #{name}-#{version} from '#{self.url}'"
    self.cmd "pwd"
    self.cmd "curl -s -D- -o '#{self.tarfile}'  '#{self.url}'"
    self.do_unpack
  end

  def do_unpack
    self.announce "Unpacking tarball '#{self.tarfile}'"
    self.cmd "tar -xzf '#{self.tarfile}'"
  end

  def do_write_controlfile
    contents = <<-"CONTROL_FILE".strip_heredoc
      Package: #{PACKAGING_PREFIX}#{self.name}
      Version: #{self.version}
      Section: web
      Architecture: #{arch}
      Maintainer: Dave Dopson <dave@wavii.com>
      Depends: #{Array(self.depends).join(', ')}
      Pre-Depends:
      Recommends:
      Replaces: #{Array(self.replaces).join(', ')}
      Provides: #{Array(self.provides).join(', ')}
    CONTROL_FILE
    contents << "Description: #{self.description.gsub(/\n/, "\n  ")}\n"
    self.announce "Writing Control File:"
    puts contents.gsub(/^/, '>>')
    Dir.mkdir "#{self.install_root}/DEBIAN"
    File.write "#{self.install_root}/DEBIAN/control", contents
  end

  def do_build
    raise 'must be defined'
  end

  def do_package
    self.do_write_controlfile
    self.announce "DPackaging #{name}-#{version} from directory #{self.install_root}"
    self.cmd "dpkg -b '#{self.install_root}' '#{self.debfile}'"
  end

  def do_copy
    self.cmd "mv '#{self.debfile}' '#{BASE_DIRECTORY}/s3-repo/dists/#{DIST_PATH}/binary-#{arch}/'"
    self.announce "SUCCESS! Final Output: #{BASE_DIRECTORY}/s3-repo/dists/#{DIST_PATH}/binary-#{arch}/#{File.basename(self.debfile)}"
  end
end

