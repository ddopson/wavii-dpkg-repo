
class GemPackage < Package
  def self.define (pkg_name, version_spec=nil, &block)
    super(pkg_name, &block).tap do |instance|
      instance.version_spec(version_spec)
    end
  end
  
  property :version_spec, nil

  property :url, nil

  property :version do
    unless @_version
      if version_spec
        @_version = version_spec
      else
        result = `env GEM_PATH=#{gem_install_root} gem which #{gem_name}`
        # eg /home/ubuntu/wavii-dpkg-repo/install-root/usr/local/lib/ruby/gems/1.9.1/gems/bundler-1.0.21/lib/bundler.rb
        @_version = result.match(/gems\/#{gem_name}-([^\/]+)\//)[1]
        unless @_version
          return 'unknown'
        end
      end
    end
    @_version
  end

  property :depends, ["#{PACKAGING_PREFIX}ruby"]

  property :description do
    "The '#{self.gem_name}' Ruby Gem"
  end

  property :gem_name do
    name.gsub(/^ruby-/, '')
  end

  def wdversion
    version_spec || 'unknown'
  end

  def gem_install_root
    "#{self.install_root}#{self.install_prefix}/lib/ruby/gems/1.9.1"
  end

  def do_fetch
    self.announce "Installing '#{gem_name}' Gem into #{self.install_root}"
    cmd = "gem install"
    cmd << %Q{ --install-dir "#{self.gem_install_root}"}
    cmd << %Q{ --bindir "#{self.install_root}#{self.install_prefix}/bin"}
    cmd << %Q{ --ignore-dependencies }
    cmd << %Q{ #{self.gem_name}}
    if self.version_spec
      cmd << %Q{ --version "#{self.version_spec}"}
    end
    self.cmd cmd
  end

  def do_build
    nil
  end

end
