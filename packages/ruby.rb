MakefilePackage.define 'ruby' do
  description "Ruby. A dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write."

  version '1.9.3-p362'

  def url
    "http://ftp.ruby-lang.org/pub/ruby/1.9/#{self.name}-#{self.version}.tar.gz"
  end

  depends 'openssl'
  build_depends %w{
    libc6-dev
    libssl-dev
    libmysql++-dev
    libsqlite3-dev
    libssl-dev
    libreadline6-dev
    libyaml-dev
    zlib1g-dev
  }
  provides ['ruby', 'ruby-dev', 'libruby', 'rake', 'irb', 'ruby-interpreter', 'rdoc']
  replaces ['ruby', 'ruby1.8', 'libruby1.8']
end
