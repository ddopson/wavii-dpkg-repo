#!/usr/bin/env ruby

class Package
  def name
    raise 'This must be defined'
  end
  
  def version
    raise 'This must be defined'
  end
  
  def url
    raise 'This must be defined'
  end
  
  def tarfile
    "#{name}-#{version}.tar.gz"
  end

  def arch
    'i386'
  end

  def do_all
    self.do_fetch
    self.do_unpack
    self.do_build
    self.do_package
  end

  def do_fetch
    puts "Downloading #{name}-#{version} from '#{self.url}'"
    `curl -s '#{self.url}' > #{self.tarfile}`
  end

  def do_unpack
    `tar -xzf #{self.tarfile}`
    # TODO: check that everything unpacks to a single dir and then pass that dir to build
  end

  def do_build_configure
    `./configure --prefix=/usr`
  end

  def do_build
    self.do_build_configure
    self.do_build_build
  end

  def do_build_build
    `make`
  end

  def do_build_install
    `make install DESTDIR="#{self.install_root}"`
  end

  def do_package
    `dpkg -b "#{self.install_root}" "#{name}-#{version}-#{arch}.deb"`
  end

end

