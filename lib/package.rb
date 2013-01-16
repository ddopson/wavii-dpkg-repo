#!/usr/bin/env ruby

class Package
  include Rake::DSL

  def self.define (pkg_name, &block)
    c = Class.new(self, &block)
    puts "Defining name on class"
    c.send :define_method, :name, lambda { pkg_name }
    Kernel.const_set pkg_name.to_s.camelize, c
  end

  def self.declare_properties(hash)
    hash.each do |sym, default|
      if default.is_a? Proc
        self.send :define_method, sym, default
      else
        self.send :define_method, sym do
          if default == :required
            raise "'#{sym.to_s}' must be defined"
          end
          default
        end
      end

      self.define_singleton_method(sym) do |str|
        if str.is_a? Proc
          self.send :define_method, sym, str
        else
          self.send :define_method, sym, lambda { str }
        end
      end
    end
  end

  self.declare_properties(
    :description => :required,
    :version => :required,
    :url => :required,
    :homepage => nil,
    :depends => [],
    :build_depends => [],
    :arch => ARCH,
    :install_prefix => '/usr/local',
    :provides => lambda { [self.name, "#{PACKAGING_PREFIX}#{self.name}"] },
    :replaces => lambda { [self.name] },
  )

  def wdversion
    version # this is a hack so for packages w/o a specified version
  end

  def working_dir
    "#{BASE_DIRECTORY}/tmp/#{self.name}-#{self.version}"
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

  ####################################################################################################
  # Machinery - does work
  ####################################################################################################

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
    self.do_clean
    self.do_deps
    self.do_fetch
    self.do_build
    self.do_package
    self.do_copy
  end

  def do_clean
    if File.exists?(self.working_dir)
      self.announce "Cleaning out old contents from #{self.working_dir}"
      FileUtils.rm_rf(self.working_dir)
    end
    FileUtils.mkdir_p(self.working_dir)
  end

  def do_deps
    deps = Array(self.build_depends)
    if deps.length > 0
      self.announce "Ensuring that all the build dependencies are installed - {#{deps.join(', ')}}"
      self.cmd "sudo apt-get -y install #{deps.join(' ')}"
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

