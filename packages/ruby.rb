class Ruby < Package
  def name
    'ruby'
  end

  def description
    "Ruby. A dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write." 
  end

  def version
    '1.9.3-p362'
  end

  def url
    "http://ftp.ruby-lang.org/pub/ruby/1.9/#{self.name}-#{self.version}.tar.gz"
  end

  def depends
    'openssl'
  end

  def build_depends
    %w{
      libc6-dev
      libssl-dev
      libmysql++-dev
      libsqlite3-dev
      libssl-dev 
      libreadline6-dev
      libyaml-dev
      zlib1g-dev
    }
  end

  def do_build
    self.announce "Ensuring that all the build dependencies are installed"
    self.cmd "sudo apt-get -y install #{self.build_depends.join(' ')}"
    super
  end

  def provides
    ['ruby', 'ruby-dev', 'libruby', 'rake', 'irb', 'ruby-interpreter', 'rdoc']
  end

  def replaces
    ['ruby', 'ruby1.8', 'libruby1.8']
  end
end
