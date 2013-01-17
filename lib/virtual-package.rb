class VirtualPackage < Package
  property :url, nil

  def do_fetch
    nil
  end

  def do_build
    FileUtils.mkdir_p self.install_root
  end
end
