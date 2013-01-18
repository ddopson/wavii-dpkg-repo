
class GemPackage < Package
  def self.define (gem_name, version, &block)
    super("ruby-#{gem_name.gsub('_', '-')}") do |instance|
      instance.gem_name(gem_name)
      instance.version(version)
      instance.instance_eval(&block) if block_given?
    end
  end
  property :version_spec do
    self.version
  end

  property :depends, ["#{PACKAGING_PREFIX}ruby"]

  property :description do
    "The '#{self.gem_name}' Ruby Gem"
  end

  property :gem_name do
    name.gsub(/^ruby-/, '')
  end

  property :pkgname do
    "#{self.name}-#{self.version}"
  end

  def gem_install_root
    "#{self.install_root}#{self.install_prefix}/lib/ruby/gems/1.9.1"
  end

  def do_fetch
    FileUtils.mkdir_p "#{self.install_root}2#{self.install_prefix}"

    self.announce "Installing '#{gem_name}' Gem into #{self.install_root}"
    cmd = "gem install"
    cmd << %Q{ --install-dir "#{self.gem_install_root}"}
    cmd << %Q{ --bindir "#{self.install_root}2#{self.install_prefix}/bin"}
    cmd << %Q{ --ignore-dependencies }
    cmd << %Q{ #{self.gem_name}}
    if self.version_spec
      cmd << %Q{ --version "#{self.version_spec}"}
    end
    self.cmd cmd
  end

  def do_build
    if File.exists? "#{self.install_root}2#{self.install_prefix}/bin"
      me = self
      @binpkg = Package.define "#{me.name}-bin" do
        description "The executable for ruby gem '#{me.name}'"
        version '0.0.0'
        depends me.name
        provides me.name
      end
      @binpkg.do_clean
      self.cmd "mkdir -p #{@binpkg.install_root}#{self.install_prefix}"
      self.cmd "mv #{self.install_root}2#{self.install_prefix}/bin #{@binpkg.install_root}#{self.install_prefix}"
    end
  end

  def do_package
    super
    @binpkg.do_package if @binpkg
  end

  def do_copy
    super
    @binpkg.do_copy if @binpkg
  end
end
