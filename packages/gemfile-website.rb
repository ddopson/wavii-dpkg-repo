#GemPackage.define "abingo", "0.1.2"
#GemPackage.define "premailer", "1.7.3" do
#  depends %w{
#    wavii-ruby-css-parser
#    wavii-ruby-htmlentities
#  }
#end
GemPackage.define "activeadmin", "0.3.1" do
  depends %w{
    wavii-ruby-devise
    wavii-ruby-fastercsv
    wavii-ruby-formtastic
    wavii-ruby-inherited-resources
    wavii-ruby-kaminari
    wavii-ruby-meta-search
    wavii-ruby-rails
    wavii-ruby-sass
  }
end
#GemPackage.define "home_run", "1.0.4"
GemPackage.define "redis-actionpack", "3.1.4" do
  depends %w{
    wavii-ruby-actionpack
    wavii-ruby-redis-rack
    wavii-ruby-redis-store
  }
end
GemPackage.define "redis-activesupport", "3.1.4" do
  depends %w{
    wavii-ruby-activesupport
    wavii-ruby-redis-store
  }
end
GemPackage.define "redis-rack", "1.3.6" do
  depends %w{
    wavii-ruby-rack
    wavii-ruby-redis-store
  }
end
GemPackage.define "redis-rails", "3.1.4" do
  depends %w{
    wavii-ruby-redis-actionpack
    wavii-ruby-redis-activesupport
    wavii-ruby-redis-store
  }
end
GemPackage.define "redis-store", "1.1.0" do
  depends %w{
    wavii-ruby-redis
  }
end
#GemPackage.define "dynamic_form", "1.1.3"
#GemPackage.define "newrelic_api", "1.2.3"
#GemPackage.define "twitter", "2.1.0" do
#  depends %w{
#    wavii-ruby-activesupport
#    wavii-ruby-faraday
#    wavii-ruby-multi-json
#    wavii-ruby-simple-oauth
#  }
#end
#GemPackage.define "active_form", "1.0.3" do
#  depends %w{
#    wavii-ruby-activemodel
#    wavii-ruby-activesupport
#  }
#end
#GemPackage.define "thrift", "0.9.0.1"
#GemPackage.define "friendly_id", "3.2.1.1" do
#  depends %w{
#    wavii-ruby-babosa
#  }
#end
GemPackage.define "jade-js-source", "0.28.0"
#GemPackage.define "jsonpath", "0.4.2" do
#  depends %w{
#    wavii-ruby-multi-json
#  }
#end
GemPackage.define "omniauth-oauth", "1.0.1" do
  depends %w{
    wavii-ruby-oauth
    wavii-ruby-omniauth
  }
end
#GemPackage.define "profiler", "0.0.1"
#GemPackage.define "ruvii", "0.0.1" do
#  depends %w{
#    wavii-ruby-activesupport
#    wavii-ruby-term-ansicolor
#  }
#end
#GemPackage.define "useragent", "0.4.3"
#GemPackage.define "wapn", "0.0.1"
GemPackage.define "ZenTest", "4.6.2"
GemPackage.define "actionmailer", "3.1.5" do
  depends %w{
    wavii-ruby-actionpack
    wavii-ruby-mail
  }
end
GemPackage.define "actionpack", "3.1.5" do
  depends %w{
    wavii-ruby-activemodel
    wavii-ruby-activesupport
    wavii-ruby-builder
    wavii-ruby-erubis
    wavii-ruby-i18n
    wavii-ruby-rack
    wavii-ruby-rack-cache
    wavii-ruby-rack-mount
    wavii-ruby-rack-test
    wavii-ruby-sprockets
  }
end
GemPackage.define "active_reload", "0.6.1"
GemPackage.define "activemodel", "3.1.5" do
  depends %w{
    wavii-ruby-activesupport
    wavii-ruby-builder
    wavii-ruby-i18n
  }
end
GemPackage.define "activerecord", "3.1.5" do
  depends %w{
    wavii-ruby-activemodel
    wavii-ruby-activesupport
    wavii-ruby-arel
    wavii-ruby-tzinfo
  }
end
GemPackage.define "activerecord-import", "0.2.9" do
  depends %w{
    wavii-ruby-activerecord
  }
end
GemPackage.define "activeresource", "3.1.5" do
  depends %w{
    wavii-ruby-activemodel
    wavii-ruby-activesupport
  }
end
GemPackage.define "activesupport", "3.1.5" do
  depends %w{
    wavii-ruby-multi-json
  }
end
GemPackage.define "addressable", "2.2.8"
GemPackage.define "airbrake", "3.1.6" do
  depends %w{
    wavii-ruby-builder
    wavii-ruby-girl-friday
  }
end
GemPackage.define "arel", "2.2.3"
GemPackage.define "autotest", "4.4.6" do
  depends %w{
    wavii-ruby-ZenTest
  }
end
GemPackage.define "aws_cloud_search", "0.0.1" do
  depends %w{
    wavii-ruby-faraday-middleware
  }
end
GemPackage.define "babosa", "0.3.5"
GemPackage.define "bcrypt-ruby", "3.0.1"
GemPackage.define "builder", "3.0.4"
GemPackage.define "bunny", "0.8.0"
GemPackage.define "cancan", "1.6.5"
GemPackage.define "capybara", "1.1.2" do
  depends %w{
    wavii-ruby-mime-types
    wavii-ruby-nokogiri
    wavii-ruby-rack
    wavii-ruby-rack-test
    wavii-ruby-selenium-webdriver
    wavii-ruby-xpath
  }
end
GemPackage.define "chef", "0.10.10" do
  depends %w{
    wavii-ruby-bunny
    wavii-ruby-erubis
    wavii-ruby-highline
    wavii-ruby-json
    wavii-ruby-mixlib-authentication
    wavii-ruby-mixlib-cli
    wavii-ruby-mixlib-config
    wavii-ruby-mixlib-log
    wavii-ruby-mixlib-shellout
    wavii-ruby-moneta
    wavii-ruby-net-ssh
    wavii-ruby-net-ssh-multi
    wavii-ruby-ohai
    wavii-ruby-rest-client
    wavii-ruby-treetop
    wavii-ruby-uuidtools
    wavii-ruby-yajl-ruby
  }
end
GemPackage.define "childprocess", "0.2.5" do
  depends %w{
    wavii-ruby-ffi
  }
end
GemPackage.define "chronic", "0.6.7"
GemPackage.define "chunky_png", "1.2.5"
GemPackage.define "coffee-rails", "3.1.0" do
  depends %w{
    wavii-ruby-coffee-script
    wavii-ruby-railties
  }
end
GemPackage.define "coffee-script", "2.2.0" do
  depends %w{
    wavii-ruby-coffee-script-source
    wavii-ruby-execjs
  }
end
GemPackage.define "coffee-script-source", "1.1.2"
GemPackage.define "columnize", "0.3.6"
GemPackage.define "compass", "0.12.rc.1" do
  depends %w{
    wavii-ruby-chunky-png
    wavii-ruby-fssm
    wavii-ruby-sass
  }
end
GemPackage.define "compass-rails", "1.0.0.rc.2" do
  depends %w{
    wavii-ruby-compass
  }
end
GemPackage.define "connection_pool", "0.9.2"
GemPackage.define "css_parser", "1.2.6" do
  depends %w{
    wavii-ruby-addressable
    wavii-ruby-rdoc
  }
end
GemPackage.define "cucumber", "1.1.4" do
  depends %w{
    wavii-ruby-builder
    wavii-ruby-diff-lcs
    wavii-ruby-gherkin
    wavii-ruby-json
    wavii-ruby-term-ansicolor
  }
end
GemPackage.define "cucumber-rails", "1.2.1" do
  depends %w{
    wavii-ruby-capybara
    wavii-ruby-cucumber
    wavii-ruby-nokogiri
  }
end
GemPackage.define "database_cleaner", "0.6.7"
GemPackage.define "debugger", "1.1.1" do
  depends %w{
    wavii-ruby-columnize
    wavii-ruby-debugger-linecache
    wavii-ruby-debugger-ruby-core-source
  }
end
GemPackage.define "debugger-linecache", "1.1.1" do
  depends %w{
    wavii-ruby-debugger-ruby-core-source
  }
end
GemPackage.define "debugger-ruby_core_source", "1.1.1"
GemPackage.define "devise", "2.1.0.rc" do
  depends %w{
    wavii-ruby-bcrypt-ruby
    wavii-ruby-orm-adapter
    wavii-ruby-railties
    wavii-ruby-warden
  }
end
GemPackage.define "diff-lcs", "1.1.3"
GemPackage.define "email_spec", "1.2.1" do
  depends %w{
    wavii-ruby-mail
    wavii-ruby-rspec
  }
end
GemPackage.define "erubis", "2.7.0"
GemPackage.define "escape", "0.0.4"
GemPackage.define "excon", "0.6.6"
GemPackage.define "execjs", "1.4.0" do
  depends %w{
    wavii-ruby-multi-json
  }
end
GemPackage.define "faraday", "0.7.6" do
  depends %w{
    wavii-ruby-addressable
    wavii-ruby-multipart-post
    wavii-ruby-rack
  }
end
GemPackage.define "faraday_middleware", "0.8.7" do
  depends %w{
    wavii-ruby-faraday
  }
end
GemPackage.define "fastercsv", "1.5.4"
GemPackage.define "ffaker", "1.8.1"
GemPackage.define "ffi", "1.0.11"
GemPackage.define "fog", "0.8.2" do
  depends %w{
    wavii-ruby-builder
    wavii-ruby-excon
    wavii-ruby-formatador
    wavii-ruby-json
    wavii-ruby-mime-types
    wavii-ruby-net-ssh
    wavii-ruby-nokogiri
    wavii-ruby-ruby-hmac
  }
end
GemPackage.define "formatador", "0.2.1"
GemPackage.define "formtastic", "1.2.4" do
  depends %w{
    wavii-ruby-actionpack
    wavii-ruby-activesupport
    wavii-ruby-i18n
  }
end
GemPackage.define "fssm", "0.2.8.1"
GemPackage.define "gherkin", "2.7.2" do
  depends %w{
    wavii-ruby-json
  }
end
GemPackage.define "girl_friday", "0.10.0" do
  depends %w{
    wavii-ruby-connection-pool
  }
end
GemPackage.define "git", "1.2.5"
GemPackage.define "grid-coordinates", "1.1.5" do
  depends %w{
    wavii-ruby-compass
  }
end
GemPackage.define "guard", "1.0.1" do
  depends %w{
    wavii-ruby-ffi
    wavii-ruby-thor
  }
end
GemPackage.define "guard-bundler", "0.1.3" do
  depends %w{
    wavii-ruby-bundler
    wavii-ruby-guard
  }
end
GemPackage.define "guard-rspec", "0.7.0" do
  depends %w{
    wavii-ruby-guard
  }
end
GemPackage.define "guard-spork", "0.7.1" do
  depends %w{
    wavii-ruby-guard
    wavii-ruby-spork
  }
end
GemPackage.define "has_scope", "0.5.1"
GemPackage.define "hashie", "1.2.0"
GemPackage.define "highline", "1.6.14"
GemPackage.define "hike", "1.2.1"
GemPackage.define "hipchat", "0.4.1" do
  depends %w{
    wavii-ruby-httparty
  }
end
GemPackage.define "hogan_assets", "1.3.1" do
  depends %w{
    wavii-ruby-execjs
    wavii-ruby-sprockets
    wavii-ruby-tilt
  }
end
GemPackage.define "htmlentities", "4.3.1"
GemPackage.define "httparty", "0.8.1" do
  depends %w{
    wavii-ruby-multi-json
    wavii-ruby-multi-xml
  }
end
GemPackage.define "httpauth", "0.2.0"
GemPackage.define "i18n", "0.6.0"
GemPackage.define "inherited_resources", "1.2.2" do
  depends %w{
    wavii-ruby-has-scope
    wavii-ruby-responders
  }
end
GemPackage.define "inifile", "0.4.1"
GemPackage.define "ipaddress", "0.8.0"
GemPackage.define "json", "1.6.1"
GemPackage.define "kaminari", "0.13.0" do
  depends %w{
    wavii-ruby-actionpack
    wavii-ruby-activesupport
    wavii-ruby-railties
  }
end
GemPackage.define "kestrel-client", "0.7.1" do
  depends %w{
    wavii-ruby-memcached
  }
end
GemPackage.define "kgio", "2.6.0"
GemPackage.define "knife-ec2", "0.5.10" do
  depends %w{
    wavii-ruby-fog
  }
end
GemPackage.define "koala", "1.1.0" do
  depends %w{
    wavii-ruby-multi-json
    wavii-ruby-multipart-post
  }
end
GemPackage.define "launchy", "2.0.5" do
  depends %w{
    wavii-ruby-addressable
  }
end
GemPackage.define "log4r", "1.1.9"
GemPackage.define "machinist", "1.0.6"
GemPackage.define "mail", "2.3.3" do
  depends %w{
    wavii-ruby-i18n
    wavii-ruby-mime-types
    wavii-ruby-treetop
  }
end
GemPackage.define "mail_safe", "0.3.1" do
  depends %w{
    wavii-ruby-actionmailer
  }
end
GemPackage.define "memcached", "1.4.1"
GemPackage.define "meta_search", "1.1.1" do
  depends %w{
    wavii-ruby-actionpack
    wavii-ruby-activerecord
    wavii-ruby-activesupport
    wavii-ruby-polyamorous
  }
end
GemPackage.define "mime-types", "1.19"
GemPackage.define "mixlib-authentication", "1.3.0" do
  depends %w{
    wavii-ruby-mixlib-log
  }
end
GemPackage.define "mixlib-cli", "1.2.2"
GemPackage.define "mixlib-config", "1.1.2"
GemPackage.define "mixlib-log", "1.4.1"
GemPackage.define "mixlib-shellout", "1.0.0"
GemPackage.define "mixpanel", "1.1.3" do
  depends %w{
    wavii-ruby-escape
    wavii-ruby-json
    wavii-ruby-rack
  }
end
GemPackage.define "mixpanel_client", "3.0.0" do
  depends %w{
    wavii-ruby-json
  }
end
GemPackage.define "moneta", "0.6.0"
GemPackage.define "multi_json", "1.0.4"
GemPackage.define "multi_xml", "0.4.1"
GemPackage.define "multipart-post", "1.1.5"
GemPackage.define "mustache", "0.99.4"
GemPackage.define "mysql2", "0.3.11"
GemPackage.define "net-ssh", "2.2.2"
GemPackage.define "net-ssh-gateway", "1.1.0" do
  depends %w{
    wavii-ruby-net-ssh
  }
end
GemPackage.define "net-ssh-multi", "1.1" do
  depends %w{
    wavii-ruby-net-ssh
    wavii-ruby-net-ssh-gateway
  }
end
GemPackage.define "newrelic-redis", "1.4.0" do
  depends %w{
    wavii-ruby-newrelic-rpm
    wavii-ruby-redis
  }
end
GemPackage.define "newrelic_rpm", "3.5.3.25"
GemPackage.define "nokogiri", "1.5.4"
GemPackage.define "nyan-cat-formatter", "0.0.7"
GemPackage.define "oauth", "0.4.6"
GemPackage.define "oauth2", "0.6.0" do
  depends %w{
    wavii-ruby-faraday
    wavii-ruby-httpauth
    wavii-ruby-multi-json
  }
end
GemPackage.define "ohai", "6.14.0" do
  depends %w{
    wavii-ruby-ipaddress
    wavii-ruby-mixlib-cli
    wavii-ruby-mixlib-config
    wavii-ruby-mixlib-log
    wavii-ruby-systemu
    wavii-ruby-yajl-ruby
  }
end
#GemPackage.define "omniauth", "1.1.1" do
#  depends %w{
#    wavii-ruby-hashie
#    wavii-ruby-rack
#  }
#end
GemPackage.define "omniauth-facebook", "1.4.0" do
  depends %w{
    wavii-ruby-omniauth-oauth2
  }
end
GemPackage.define "omniauth-oauth2", "1.0.2" do
  depends %w{
    wavii-ruby-oauth2
    wavii-ruby-omniauth
  }
end
GemPackage.define "omniauth-twitter", "0.0.9" do
  depends %w{
    wavii-ruby-omniauth-oauth
  }
end
GemPackage.define "orm_adapter", "0.0.7"
GemPackage.define "parallel", "0.5.16"
GemPackage.define "parallel_tests", "0.7.2" do
  depends %w{
    wavii-ruby-parallel
  }
end
GemPackage.define "polyamorous", "0.5.0" do
  depends %w{
    wavii-ruby-activerecord
  }
end
GemPackage.define "polyglot", "0.3.3"
GemPackage.define "rack", "1.3.6"
GemPackage.define "rack-cache", "1.2" do
  depends %w{
    wavii-ruby-rack
  }
end
GemPackage.define "rack-mount", "0.8.3" do
  depends %w{
    wavii-ruby-rack
  }
end
GemPackage.define "rack-ssl", "1.3.2" do
  depends %w{
    wavii-ruby-rack
  }
end
GemPackage.define "rack-test", "0.6.1" do
  depends %w{
    wavii-ruby-rack
  }
end
GemPackage.define "rails", "3.1.5" do
  depends %w{
    wavii-ruby-actionmailer
    wavii-ruby-actionpack
    wavii-ruby-activerecord
    wavii-ruby-activeresource
    wavii-ruby-activesupport
    wavii-ruby-bundler
    wavii-ruby-railties
  }
end
GemPackage.define "rails-dev-tweaks", "0.6.1" do
  depends %w{
    wavii-ruby-actionpack
    wavii-ruby-railties
  }
end
GemPackage.define "railties", "3.1.5" do
  depends %w{
    wavii-ruby-actionpack
    wavii-ruby-activesupport
    wavii-ruby-rack-ssl
    wavii-ruby-rake
    wavii-ruby-rdoc
    wavii-ruby-thor
  }
end
GemPackage.define "raindrops", "0.8.0"
GemPackage.define "rake", "0.9.2"
GemPackage.define "rdoc", "3.12" do
  depends %w{
    wavii-ruby-json
  }
end
#GemPackage.define "redis", "2.2.2"
GemPackage.define "redis-objects", "0.5.2" do
  depends %w{
    wavii-ruby-redis
  }
end
GemPackage.define "responders", "0.6.4"
GemPackage.define "rest-client", "1.6.7" do
  depends %w{
    wavii-ruby-mime-types
  }
end
GemPackage.define "retryable", "1.2.5"
GemPackage.define "right_aws", "2.1.0" do
  depends %w{
    wavii-ruby-right-http-connection
  }
end
GemPackage.define "right_http_connection", "1.3.0"
GemPackage.define "rpm_contrib", "2.1.11" do
  depends %w{
    wavii-ruby-newrelic-rpm
  }
end
GemPackage.define "rspec", "2.8.0" do
  depends %w{
    wavii-ruby-rspec-core
    wavii-ruby-rspec-expectations
    wavii-ruby-rspec-mocks
  }
end
GemPackage.define "rspec-core", "2.8.0"
GemPackage.define "rspec-expectations", "2.8.0" do
  depends %w{
    wavii-ruby-diff-lcs
  }
end
GemPackage.define "rspec-mocks", "2.8.0"
GemPackage.define "rspec-rails", "2.8.1" do
  depends %w{
    wavii-ruby-actionpack
    wavii-ruby-activesupport
    wavii-ruby-railties
    wavii-ruby-rspec
  }
end
GemPackage.define "ruby-hmac", "0.4.0"
GemPackage.define "ruby-prof", "0.10.8"
GemPackage.define "ruby_gntp", "0.3.4"
GemPackage.define "rubyzip", "0.9.5"
GemPackage.define "sass", "3.1.13"
GemPackage.define "sass-rails", "3.1.5" do
  depends %w{
    wavii-ruby-actionpack
    wavii-ruby-railties
    wavii-ruby-sass
    wavii-ruby-tilt
  }
end
GemPackage.define "selenium-webdriver", "2.16.0" do
  depends %w{
    wavii-ruby-childprocess
    wavii-ruby-ffi
    wavii-ruby-multi-json
    wavii-ruby-rubyzip
  }
end
GemPackage.define "simple_oauth", "0.2.0"
GemPackage.define "slim", "1.0.2" do
  depends %w{
    wavii-ruby-temple
    wavii-ruby-tilt
  }
end
GemPackage.define "spork", "0.9.0.rc9"
GemPackage.define "sprockets", "2.0.4" do
  depends %w{
    wavii-ruby-hike
    wavii-ruby-rack
    wavii-ruby-tilt
  }
end
GemPackage.define "sqlite3", "1.3.4"
GemPackage.define "strip_attributes", "1.0.3" do
  depends %w{
    wavii-ruby-activemodel
  }
end
GemPackage.define "systemu", "2.5.2"
GemPackage.define "temple", "0.3.4"
GemPackage.define "term-ansicolor", "1.0.7"
GemPackage.define "thor", "0.14.6"
GemPackage.define "tilt", "1.3.3"
GemPackage.define "tilt-jade", "1.1.2" do
  depends %w{
    wavii-ruby-execjs
    wavii-ruby-jade-js-source
    wavii-ruby-sprockets
    wavii-ruby-tilt
  }
end
GemPackage.define "treetop", "1.4.10" do
  depends %w{
    wavii-ruby-polyglot
  }
end
GemPackage.define "tzinfo", "0.3.33"
GemPackage.define "uglifier", "1.0.3" do
  depends %w{
    wavii-ruby-execjs
    wavii-ruby-multi-json
  }
end
GemPackage.define "unicorn", "4.1.1" do
  depends %w{
    wavii-ruby-kgio
    wavii-ruby-rack
    wavii-ruby-raindrops
  }
end
GemPackage.define "uuidtools", "2.1.3"
GemPackage.define "warden", "1.1.1" do
  depends %w{
    wavii-ruby-rack
  }
end
GemPackage.define "xpath", "0.1.4" do
  depends %w{
    wavii-ruby-nokogiri
  }
end
GemPackage.define "yajl-ruby", "1.1.0"
VirtualPackage.define 'gemfile-website' do
  description 'All ruby gems for the wavii front-end website'
  version '0.0.1'
  depends %w{
    #wavii-ruby-abingo-0.1.2
    #wavii-ruby-premailer-1.7.3
    wavii-ruby-activeadmin-0.3.1
    #wavii-ruby-home_run-1.0.4
    wavii-ruby-redis-actionpack-3.1.4
    wavii-ruby-redis-activesupport-3.1.4
    wavii-ruby-redis-rack-1.3.6
    wavii-ruby-redis-rails-3.1.4
    wavii-ruby-redis-store-1.1.0
    #wavii-ruby-dynamic_form-1.1.3
    #wavii-ruby-newrelic_api-1.2.3
    #wavii-ruby-twitter-2.1.0
    #wavii-ruby-active_form-1.0.3
    #wavii-ruby-thrift-0.9.0.1
    #wavii-ruby-friendly_id-3.2.1.1
    wavii-ruby-jade-js-source-0.28.0
    #wavii-ruby-jsonpath-0.4.2
    wavii-ruby-omniauth-oauth-1.0.1
    #wavii-ruby-profiler-0.0.1
    #wavii-ruby-ruvii-0.0.1
    #wavii-ruby-useragent-0.4.3
    #wavii-ruby-wapn-0.0.1
    wavii-ruby-ZenTest-4.6.2
    wavii-ruby-actionmailer-3.1.5
    wavii-ruby-actionpack-3.1.5
    wavii-ruby-active_reload-0.6.1
    wavii-ruby-activemodel-3.1.5
    wavii-ruby-activerecord-3.1.5
    wavii-ruby-activerecord-import-0.2.9
    wavii-ruby-activeresource-3.1.5
    wavii-ruby-activesupport-3.1.5
    wavii-ruby-addressable-2.2.8
    wavii-ruby-airbrake-3.1.6
    wavii-ruby-arel-2.2.3
    wavii-ruby-autotest-4.4.6
    wavii-ruby-aws_cloud_search-0.0.1
    wavii-ruby-babosa-0.3.5
    wavii-ruby-bcrypt-ruby-3.0.1
    wavii-ruby-builder-3.0.4
    wavii-ruby-bunny-0.8.0
    wavii-ruby-cancan-1.6.5
    wavii-ruby-capybara-1.1.2
    wavii-ruby-chef-0.10.10
    wavii-ruby-childprocess-0.2.5
    wavii-ruby-chronic-0.6.7
    wavii-ruby-chunky_png-1.2.5
    wavii-ruby-coffee-rails-3.1.0
    wavii-ruby-coffee-script-2.2.0
    wavii-ruby-coffee-script-source-1.1.2
    wavii-ruby-columnize-0.3.6
    wavii-ruby-compass-0.12.rc.1
    wavii-ruby-compass-rails-1.0.0.rc.2
    wavii-ruby-connection_pool-0.9.2
    wavii-ruby-css_parser-1.2.6
    wavii-ruby-cucumber-1.1.4
    wavii-ruby-cucumber-rails-1.2.1
    wavii-ruby-database_cleaner-0.6.7
    wavii-ruby-debugger-1.1.1
    wavii-ruby-debugger-linecache-1.1.1
    wavii-ruby-debugger-ruby_core_source-1.1.1
    wavii-ruby-devise-2.1.0.rc
    wavii-ruby-diff-lcs-1.1.3
    wavii-ruby-email_spec-1.2.1
    wavii-ruby-erubis-2.7.0
    wavii-ruby-escape-0.0.4
    wavii-ruby-excon-0.6.6
    wavii-ruby-execjs-1.4.0
    wavii-ruby-faraday-0.7.6
    wavii-ruby-faraday_middleware-0.8.7
    wavii-ruby-fastercsv-1.5.4
    wavii-ruby-ffaker-1.8.1
    wavii-ruby-ffi-1.0.11
    wavii-ruby-fog-0.8.2
    wavii-ruby-formatador-0.2.1
    wavii-ruby-formtastic-1.2.4
    wavii-ruby-fssm-0.2.8.1
    wavii-ruby-gherkin-2.7.2
    wavii-ruby-girl_friday-0.10.0
    wavii-ruby-git-1.2.5
    wavii-ruby-grid-coordinates-1.1.5
    wavii-ruby-guard-1.0.1
    wavii-ruby-guard-bundler-0.1.3
    wavii-ruby-guard-rspec-0.7.0
    wavii-ruby-guard-spork-0.7.1
    wavii-ruby-has_scope-0.5.1
    wavii-ruby-hashie-1.2.0
    wavii-ruby-highline-1.6.14
    wavii-ruby-hike-1.2.1
    wavii-ruby-hipchat-0.4.1
    wavii-ruby-hogan_assets-1.3.1
    wavii-ruby-htmlentities-4.3.1
    wavii-ruby-httparty-0.8.1
    wavii-ruby-httpauth-0.2.0
    wavii-ruby-i18n-0.6.0
    wavii-ruby-inherited_resources-1.2.2
    wavii-ruby-inifile-0.4.1
    wavii-ruby-ipaddress-0.8.0
    wavii-ruby-json-1.6.1
    wavii-ruby-kaminari-0.13.0
    wavii-ruby-kestrel-client-0.7.1
    wavii-ruby-kgio-2.6.0
    wavii-ruby-knife-ec2-0.5.10
    wavii-ruby-koala-1.1.0
    wavii-ruby-launchy-2.0.5
    wavii-ruby-log4r-1.1.9
    wavii-ruby-machinist-1.0.6
    wavii-ruby-mail-2.3.3
    wavii-ruby-mail_safe-0.3.1
    wavii-ruby-memcached-1.4.1
    wavii-ruby-meta_search-1.1.1
    wavii-ruby-mime-types-1.19
    wavii-ruby-mixlib-authentication-1.3.0
    wavii-ruby-mixlib-cli-1.2.2
    wavii-ruby-mixlib-config-1.1.2
    wavii-ruby-mixlib-log-1.4.1
    wavii-ruby-mixlib-shellout-1.0.0
    wavii-ruby-mixpanel-1.1.3
    wavii-ruby-mixpanel_client-3.0.0
    wavii-ruby-moneta-0.6.0
    wavii-ruby-multi_json-1.0.4
    wavii-ruby-multi_xml-0.4.1
    wavii-ruby-multipart-post-1.1.5
    wavii-ruby-mustache-0.99.4
    wavii-ruby-mysql2-0.3.11
    wavii-ruby-net-ssh-2.2.2
    wavii-ruby-net-ssh-gateway-1.1.0
    wavii-ruby-net-ssh-multi-1.1
    wavii-ruby-newrelic-redis-1.4.0
    wavii-ruby-newrelic_rpm-3.5.3.25
    wavii-ruby-nokogiri-1.5.4
    wavii-ruby-nyan-cat-formatter-0.0.7
    wavii-ruby-oauth-0.4.6
    wavii-ruby-oauth2-0.6.0
    wavii-ruby-ohai-6.14.0
    #wavii-ruby-omniauth-1.1.1
    wavii-ruby-omniauth-facebook-1.4.0
    wavii-ruby-omniauth-oauth2-1.0.2
    wavii-ruby-omniauth-twitter-0.0.9
    wavii-ruby-orm_adapter-0.0.7
    wavii-ruby-parallel-0.5.16
    wavii-ruby-parallel_tests-0.7.2
    wavii-ruby-polyamorous-0.5.0
    wavii-ruby-polyglot-0.3.3
    wavii-ruby-rack-1.3.6
    wavii-ruby-rack-cache-1.2
    wavii-ruby-rack-mount-0.8.3
    wavii-ruby-rack-ssl-1.3.2
    wavii-ruby-rack-test-0.6.1
    wavii-ruby-rails-3.1.5
    wavii-ruby-rails-dev-tweaks-0.6.1
    wavii-ruby-railties-3.1.5
    wavii-ruby-raindrops-0.8.0
    wavii-ruby-rake-0.9.2
    wavii-ruby-rdoc-3.12
    #wavii-ruby-redis-2.2.2
    wavii-ruby-redis-objects-0.5.2
    wavii-ruby-responders-0.6.4
    wavii-ruby-rest-client-1.6.7
    wavii-ruby-retryable-1.2.5
    wavii-ruby-right_aws-2.1.0
    wavii-ruby-right_http_connection-1.3.0
    wavii-ruby-rpm_contrib-2.1.11
    wavii-ruby-rspec-2.8.0
    wavii-ruby-rspec-core-2.8.0
    wavii-ruby-rspec-expectations-2.8.0
    wavii-ruby-rspec-mocks-2.8.0
    wavii-ruby-rspec-rails-2.8.1
    wavii-ruby-ruby-hmac-0.4.0
    wavii-ruby-ruby-prof-0.10.8
    wavii-ruby-ruby_gntp-0.3.4
    wavii-ruby-rubyzip-0.9.5
    wavii-ruby-sass-3.1.13
    wavii-ruby-sass-rails-3.1.5
    wavii-ruby-selenium-webdriver-2.16.0
    wavii-ruby-simple_oauth-0.2.0
    wavii-ruby-slim-1.0.2
    wavii-ruby-spork-0.9.0.rc9
    wavii-ruby-sprockets-2.0.4
    wavii-ruby-sqlite3-1.3.4
    wavii-ruby-strip_attributes-1.0.3
    wavii-ruby-systemu-2.5.2
    wavii-ruby-temple-0.3.4
    wavii-ruby-term-ansicolor-1.0.7
    wavii-ruby-thor-0.14.6
    wavii-ruby-tilt-1.3.3
    wavii-ruby-tilt-jade-1.1.2
    wavii-ruby-treetop-1.4.10
    wavii-ruby-tzinfo-0.3.33
    wavii-ruby-uglifier-1.0.3
    wavii-ruby-unicorn-4.1.1
    wavii-ruby-uuidtools-2.1.3
    wavii-ruby-warden-1.1.1
    wavii-ruby-xpath-0.1.4
    wavii-ruby-yajl-ruby-1.1.0
  }.reject{|p| p.match /^#/}
end
