class MakefilePackage < Package
  def do_build
    self.do_build_configure
    self.do_build_build
    self.do_build_install
  end

  def do_build_configure
    self.announce "Configuring Build for #{name}-#{version}"
    self.cmd "./configure --prefix=#{self.install_prefix}", self.source_dir
  end

  def do_build_build
    self.announce "Building #{name}-#{version}"
    self.cmd "make -j8", self.source_dir
  end

  def do_build_install
    self.announce "Installing #{name}-#{version} into #{self.install_root}"
    self.cmd "make install DESTDIR='#{self.install_root}'", self.source_dir
  end
end
