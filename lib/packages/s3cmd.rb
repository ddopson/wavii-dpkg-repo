class S3cmd < Package
  def name
    's3cmd'
  end

  def homepage
    'http://s3tools.org/s3cmd'
  end

  def arch
    'all'
  end

  def do_build
    # Basically, the strategy to package it is to allow it to write to /usr/local and the package up whatever gets written there
    # Thus, this package require exclusive superuser access to the entire box
    #  * mv /usr/local /usr/local.backup
    #  * do install
    #  * mv /usr/local install-root/usr/local
    #  * mv /usr/local.backup /usr/local  -- THIS HAS TO RUN NO MATTER WHAT
    self.announce "Building '#{self.name}'.  WARNING: THIS REQUIRE EXCLUSIVE SUPER-USER ACCESS TO THE MACHINE AND '/usr/local'"
    self.announce "Building '#{self.name}'.  WARNING: THIS REQUIRE EXCLUSIVE SUPER-USER ACCESS TO THE MACHINE AND '/usr/local'"
    self.announce "Building '#{self.name}'.  WARNING: THIS REQUIRE EXCLUSIVE SUPER-USER ACCESS TO THE MACHINE AND '/usr/local'"
    self.announce "Pausing a second to let that sink in"
    sleep 3
    self.cmd 'sudo mv /usr/local /usr/local.bak'
    begin
      self.cmd "sudo python setup.py install", self.source_dir
      self.cmd "mkdir -p #{self.install_root}/usr/"
      self.cmd "sudo mv /usr/local #{self.install_root}/usr/"
    ensure
      self.cmd "if [ -e /usr/local ]; then sudo mv /usr/local /usr/local.delete#{Time.now.to_i}; fi"
      self.cmd "sudo mv /usr/local.bak /usr/local"
    end
  end


  def description
    <<-"DESC".strip_heredoc
       The ultimate Amazon S3 and CloudFront command line client
       Command-line tool for uploading, retrieving and managing data in Amazon S3
       storage service. Also supports publishing to Amazon CloudFront. Designed for
       power users, easy to use in scripts.
     DESC
  end

  def version
    '1.1.0-beta3-nohang'
  end

  def url
    'wavii-repo.s3.amazonaws.com/source/s3cmd-1.1.0-beta3-nohang.tar.gz'
  end

  def depends
    "python (>= 2.5) | python-elementtree, python, python-support (>= 0.7.1)"
  end

end
