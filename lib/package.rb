#!/usr/bin/env ruby

class Array
  def reject_comments
    self.reject{|p| p.match /^#/}
  end
end

class Package < PropertyBag
  include Rake::DSL

  ALL = []

  def self.define (pkg_name, version_spec=nil, &block)
    super(pkg_name, &block).tap do |instance|
      ALL << instance
    end
  end

  property :name,             required: true
  property :pkgname do
    "#{PACKAGING_PREFIX}#{self.name}"
  end
  property :description,      required: true
  property :version,          required: true
  property :package_version, nil
  property :homepage, nil
  property :depends, []
  property :recommends, []
  property :build_depends, []
  property :arch, ARCH
  property :install_prefix, '/usr/local'
  property :provides, lambda { [self.name, "#{PACKAGING_PREFIX}#{self.name}", "#{self.pkgname}"] }
  property :replaces, []

  def package_list(list)
    a = Array(list)

    # Reject 'comment' strings that start with a '#' (make sure not to use spaces in a comment!)
    a = a.reject{|p| p.match /^#/}

    # Resolve Package objects to string names
    a = a.map{|p| p.is_a?(Package) ? p.pkgname : p }.uniq.join(', ')
  end

  property :controlfile_props do
    {
      Package:      "#{self.pkgname}",
      Version:      "#{self.version}#{self.package_version ? "-#{self.package_version}" : ""}",
      Section:      "web",
      Architecture: "#{arch}",
      Maintainer:   "Dave Dopson <dave@wavii.com>",
      Depends:      package_list(self.depends),
      Recommends:   package_list(self.recommends),
      Replaces:     package_list(self.replaces),
      Provides:     package_list(self.provides),
      Description:  self.description.gsub(/\n/, "\n  ")
    }
  end

  property :working_dir do
    "#{BASE_DIRECTORY}/tmp/#{self.name}-#{self.version}"
  end

  property :outputdir do
    "#{BASE_DIRECTORY}/s3-repo/dists/#{DIST_PATH}/binary-#{self.arch}"
  end

  property :debfile do
    "#{self.working_dir}/#{PACKAGING_PREFIX}#{self.name}-#{self.version}-#{self.arch}.deb"
  end

  property :install_root do
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

  def mkdir(dir)
    unless @dry_run
      FileUtils.mkdir_p(dir)
    end
  end

  def use_system_path(path)
    path = path.gsub(/\/+$/, '')
    self.announce "TAKING OWNERSHIP OF SYSTEM PATH: '#{path}'"
    need_bak = File.exists? path
    self.cmd "sudo mv '#{path}' '#{path.bak}'" if need_bak
    begin
      raise "Path shouldn't exist now" if File.exists?(path)
      yield
    ensure
      self.cmd "if [ -e '#{path}' ]; then sudo mv '#{path}' '#{path}.delete#{Time.now.to_i}'; fi"
      self.cmd "sudo mv '#{path.bak}' '#{path}'" if need_bak
    end
  end

  def download(url, dest=nil)
    dest ||= "#{self.working_dir}/#{File.basename(url)}"
    unless @dry_run
      cmd "curl -s -D- -o '#{dest}'  '#{url}'"
    end
  end

  def write_file(file, contents)
    unless @dry_run
      FileUtils.mkdir_p(File.dirname(file))
      File.write file, contents
    end
  end

  def do_dry
    @dry_run = true
    self.do_all
  end

  def do_df
    @dry_run = true
    @force = true
    self.do_all
  end

  def package
    self.do_package
    self.do_copy
  end
  def no_clean
    self.do_deps
    self.do_fetch
    self.do_build
    self.do_package
    self.do_copy
  end

  def do_all
    unless File.exists?("#{self.working_dir}/SUCCESS") && !@force
      self.do_clean
      self.do_deps
      self.do_fetch
      self.do_build
      self.do_package
      self.do_copy
    end
  end

  def do_clean
    unless @dry_run
      if File.exists?(self.working_dir)
        self.announce "Cleaning out old contents from #{self.working_dir}"
        FileUtils.rm_rf(self.working_dir)
      end
      FileUtils.mkdir_p(self.working_dir)
    end
  end

  def do_deps
    deps = Array(self.build_depends.reject_comments)
    if deps.length > 0
      self.announce "Ensuring that all the build dependencies are installed - {#{deps.join(', ')}}"
      self.cmd "sudo apt-get -y install #{deps.join(' ')}"
    end
  end

  def do_fetch
    raise 'must be defined'
  end

  def do_write_controlfile
    contents = ""
    controlfile_props.each do |k, v|
      contents << "#{k}: #{v}\n"
    end

    self.announce "Writing Control File: #{self.install_root}/DEBIAN/control"
    puts contents.gsub(/^/, '>>')
    self.write_file "#{self.install_root}/DEBIAN/control", contents
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
    self.cmd "mv '#{self.debfile}' '#{self.outputdir}/'"
    self.cmd "touch #{self.working_dir}/SUCCESS"
    self.announce "SUCCESS! Final Output: #{self.outputdir}/#{File.basename(self.debfile)}"
  end
end

