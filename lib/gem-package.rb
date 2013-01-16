
class GemPackage < Package
  def gem_name
    raise 'Must be provided'
  end

  def gem_version
    nil
  end

  def name
    "ruby-#{gem_name}"
  end

  def version
    unless @version
      if gem_version
        return @version = gem_version
      end
      result = `env GEM_PATH=#{gem_install_root} gem which #{gem_name}`
      # eg /home/ubuntu/wavii-dpkg-repo/install-root/usr/local/lib/ruby/gems/1.9.1/gems/bundler-1.0.21/lib/bundler.rb
      @version = result.match(/gems\/#{gem_name}-([^\/]+)\//)[1]
      unless @version
        return 'unknown'
      end
    end
    @version
  end

  def depends
    "#{PACKAGING_PREFIX}ruby"
  end

  def wdversion
    gem_version || 'unknown'
  end

  def gem_install_root
    "#{self.install_root}#{self.install_prefix}/lib/ruby/gems/1.9.1"
  end

  def description
    "The '#{self.gem_name}' Ruby Gem"
  end

  def do_fetch
    self.announce "Installing '#{gem_name}' Gem into #{self.install_root}"
    cmd = "gem install"
    cmd << %Q{ --install-dir "#{self.gem_install_root}"}
    cmd << %Q{ --bindir "#{self.install_root}#{self.install_prefix}/bin"}
    cmd << %Q{ #{self.gem_name}}
    if self.gem_version
      cmd << %Q{ --version "#{self.gem_version}"}
    end
    self.cmd cmd
  end

  def do_build
    nil
  end

end
