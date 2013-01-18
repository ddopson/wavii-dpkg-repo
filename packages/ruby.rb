MakefilePackage.define 'ruby' do
  description "Ruby. A dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write."

  version '1.9.3-p362'

  url do
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
  provides [
    'ruby', 'ruby1.9', 'wavii-ruby', 'wavii-ruby1.9',
    'ruby-dev', 'ruby-dev1.9',
    'libruby', 'libruby1.9',
    'libruby-dev', 'libruby-dev1.9',
    'rdoc', 'ruby-rdoc', 'wavii-ruby-rdoc', 'wavii-ruby-rdoc-3.9.4',
    'rake', 'ruby-rake', 'wavii-ruby-rake', 'wavii-ruby-rake-0.9.2', 'wavii-ruby-rake-0.9.2.2',
    'ruby-minitest', 'wavii-ruby-minitest', 'wavii-ruby-minitest-2.5.1',
    'ruby-io-console', 'wavii-ruby-io-console', 'wavii-ruby-io-console-0.3',
    'ruby-bigdecimal', 'wavii-ruby-bigdecimal', 'wavii-ruby-bigdecimal-1.1.0',
    'ruby-json', 'wavii-ruby-json', 'wavii-ruby-json-1.5.4',
  ]
  replaces [
    'ruby', 'ruby1.9', 'wavii-ruby', 'wavii-ruby1.9',
    'ruby-dev', 'ruby-dev1.9',
    'libruby', 'libruby1.9',
    'libruby-dev', 'libruby-dev1.9',
    'rdoc', 'ruby-rdoc', 'wavii-ruby-rdoc', 'wavii-ruby-rdoc-3.9.4',
    'rake', 'ruby-rake', 'wavii-ruby-rake', 'wavii-ruby-rake-0.9.2', 'wavii-ruby-rake-0.9.2',
    'ruby-minitest', 'wavii-ruby-minitest', 'wavii-ruby-minitest-2.5.1',
    'ruby-io-console', 'wavii-ruby-io-console', 'wavii-ruby-io-console-0.3',
    'ruby-bigdecimal', 'wavii-ruby-bigdecimal', 'wavii-ruby-bigdecimal-1.1.0',
    'ruby-json', 'wavii-ruby-json', 'wavii-ruby-json-1.5.4',
  ]
end
