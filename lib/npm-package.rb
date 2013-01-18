
class NpmPackage < Package
  def self.define (npm_name, version, &block)
    super("node-#{npm_name.gsub('_', '-')}") do |instance|
      instance.npm_name(npm_name)
      instance.version(version)
      instance.instance_eval(&block) if block_given?
    end
  end
  property :version_spec do
    self.version
  end

  property :depends, ["#{PACKAGING_PREFIX}nodejs"]

  property :description do
    "The '#{self.npm_name}' NPM module"
  end

  property :npm_name do
    name.gsub(/^node-/, '')
  end

  def do_fetch
  end

  def do_build
    self.announce "Installing '#{npm_name}' NPM module into #{self.install_root}"
    cmd = "/usr/bin/env"
    cmd << %Q{ npm_config_prefix="#{self.install_root}#{self.install_prefix}"}
    cmd << %Q{ npm install -g #{self.npm_name}@#{self.version_spec}}
    self.cmd cmd
  end

end
