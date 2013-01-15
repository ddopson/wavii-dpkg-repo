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

  def provides
    ['ruby', 'ruby-dev', 'libruby', 'rake', 'irb', 'ruby-interpreter', 'rdoc']
  end

  def replaces
    ['ruby', 'ruby1.8', 'libruby1.8']
  end
end
