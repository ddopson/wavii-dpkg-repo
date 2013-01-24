class MakefilePackage < Package
  include DownloadablePackage

  property :configure_options, ''
  property :build_options, '-j8'
  property :install_options, ''

  def do_build
    self.do_build_configure
    self.do_build_build
    self.do_build_install
  end

  def do_build_configure
    self.announce "Configuring Build for #{name}-#{version}"
    self.cmd "./configure --prefix=#{self.install_prefix} #{self.configure_options}", self.source_dir
  end

  def do_build_build
    self.announce "Building #{name}-#{version}"
    self.cmd "make #{self.build_options}", self.source_dir
  end

  def do_build_install
    self.announce "Installing #{name}-#{version} into #{self.install_root}"
    self.cmd "make install #{self.install_options} DESTDIR='#{self.install_root}'", self.source_dir
  end
end
