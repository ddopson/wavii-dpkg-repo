MakefilePackage.define 'redis' do
  description "Redis.io - A better Memcached"
  version '2.9.5.60893c6c'
  url 'http://wavii-software.s3.amazonaws.com/mirror/redis-head-2012-03-05.tar.gz'
  def do_build_configure
    # nothing
  end

  def do_build_install
    self.announce "Installing #{name}-#{version} into #{self.install_root}"
    FileUtils.mkdir_p "#{self.install_root}#{self.install_prefix}"
    self.cmd "make install PREFIX='#{self.install_root}#{self.install_prefix}'", self.source_dir
  end

end
