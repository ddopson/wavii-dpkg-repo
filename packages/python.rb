MakefilePackage.define 'python' do
  description "Python is a programming language that lets you work more quickly and integrate your systems more effectively"

  version '2.7.3'

  url do
    "http://www.python.org/ftp/python/#{self.version}/Python-#{self.version}.tar.bz2"
  end

  depends 'openssl'
  build_depends %w{
    libc6-dev
    libssl-dev
    libmysql++-dev
    libsqlite3-dev
    libssl-dev
    libreadline6-dev
    libyaml-dev
    zlib1g-dev
  }
  provides %w{
    python
    python-dev
    python-ctypes
    python-email
    python-importlib
    python-profiler
    python-wsgiref
  }
  replaces %w{
    python python1.7 python-dev
  }
  recommends %{
    wavii-python-distribute
    wavii-python-pip
  }
end

class PyPackage < Package
  def self.define (pkg_name, &block)
    super(pkg_name) do |instance|
      instance.install_prefix '/usr'
      instance.instance_eval(&block) if block_given?
    end
  end

  def fixup_dist_packages
    self.cmd "mv #{self.install_root}#{self.install_prefix}/lib/python2.7/site-packages #{self.install_root}#{self.install_prefix}/lib/python2.7/dist-packages"
  end
  
  def do_fetch
  end

  def do_build
    self.announce "Installing #{self.name} tools to ~/.local"
    self.mkdir "#{self.install_root}#{self.install_prefix}"
    self.use_system_path("~/.local") do
      self.do_build_local
      self.cmd "mv ~/.local/* #{self.install_root}#{self.install_prefix}/"
      self.cmd "rm -rf ~/.local"
      self.do_build_fixup
    end
  end

  def do_build_local
    raise 'must be defined'
  end

  def do_build_fixup
    self.fixup_dist_packages
  end
end



PyPackage.define 'python-distribute' do
  description "The python 'distribute' module which provedes 'easy_install'"
  depends %{python}

  version do
    @_cached_version ||= (
      val = `curl -s http://python-distribute.org/distribute_setup.py | grep 'DEFAULT_VERSION =' | cut -d'"' -f2`.strip
      raise 'Version not found' unless val.match /\d+/
      puts "VERSION='#{val}'"
      val
    )
  end

  provides %w{ easy-install python-setuptools }
  
  def do_fetch
    self.announce "Downloading 'distribute_setup.py'"
    self.download "http://python-distribute.org/distribute_setup.py" 
  end

  def do_build_local
    self.cmd "python distribute_setup.py #{self.version} --user"
  end
end

class PyEasyPackage < PyPackage
  def self.define (pkg_name, &block)
    super(pkg_name) do |instance|
      instance.depends %{python}
      instance.description { "The python '#{self.py_pkg}' module" }
      instance.version  do
        @_cached_version ||= (
          val = `curl -s 'http://pypi.python.org/pypi?name=#{self.py_pkg}&:action=doap'`.gsub(/.*<Version><revision>(.*)<\/revision>.*/m){ $1}.strip
          raise "Version not found in '#{val}'" unless val.match /\d+\.\d+/
          puts "VERSION='#{val}'"
          val
        )
      end
      instance.instance_eval(&block) if block_given?
    end
  end

  def py_pkg
    self.name.gsub(/^python-/, '')
  end
  
  def do_build_local
      self.cmd "easy_install --always-copy --user #{self.py_pkg}"
      self.cmd "rm -f ~/.local/lib/python2.7/site-packages/easy-install.pth"
  end
end

class PyPipPackage < PyPackage
  def self.define (pkg_name, &block)
    super(pkg_name) do |instance|
      instance.depends %{python}
      instance.description { "The python '#{self.py_pkg}' module" }
      instance.version  do
        @_cached_version ||= (
          val = `curl -s 'http://pypi.python.org/pypi?name=#{self.py_pkg}&:action=doap'`.gsub(/.*<Version><revision>(.*)<\/revision>.*/m){ $1}.strip
          raise "Version not found in '#{val}'" unless val.match /\d+\.\d+/
          puts "VERSION='#{val}'"
          val
        )
      end
      instance.instance_eval(&block) if block_given?
    end
  end

  def py_pkg
    self.name.gsub(/^python-/, '')
  end
  
  def do_build_local
      self.cmd "easy_install --always-copy --user #{self.py_pkg}"
      self.cmd "rm -f ~/.local/lib/python2.7/site-packages/easy-install.pth"
  end
end

PyEasyPackage.define 'python-pip'
PyPipPackage.define 'python-boto'
PyPipPackage.define 'python-virtualenv'

