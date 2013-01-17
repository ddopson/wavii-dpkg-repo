GemPackage.define "ruby-builder", "3.0.0"
GemPackage.define "ruby-bunny", "0.7.8"
GemPackage.define "ruby-chef", "0.10.2" do
  depends %w{
    bunny
    erubis
    highline
    json
    mixlib-authentication
    mixlib-cli
    mixlib-config
    mixlib-log
    moneta
    net-ssh
    net-ssh-multi
    ohai
    rest-client
    treetop
    uuidtools
  }.map{|g| "wavii-ruby-#{g}"}
end
GemPackage.define "ruby-erubis", "2.7.0"
GemPackage.define "ruby-excon", "0.6.6"
GemPackage.define "ruby-fog", "0.8.2" do
  depends %w{
    builder
    excon
    formatador
    json
    mime-types
    net-ssh
    nokogiri
    ruby-hmac
  }.map{|g| "wavii-ruby-#{g}"}
end
GemPackage.define "ruby-formatador", "0.2.1"
GemPackage.define "ruby-highline", "1.6.9"
GemPackage.define "ruby-inifile", "0.4.1"
GemPackage.define "ruby-json", "1.5.2"
GemPackage.define "ruby-knife-ec2", "0.5.10" do
  depends %w{
    fog
  }.map{|g| "wavii-ruby-#{g}"}
end
GemPackage.define "ruby-mime-types", "1.17.2"
GemPackage.define "ruby-mixlib-authentication", "1.1.4" do
  depends %w{
    mixlib-log
  }.map{|g| "wavii-ruby-#{g}"}
end
GemPackage.define "ruby-mixlib-cli", "1.2.2"
GemPackage.define "ruby-mixlib-config", "1.1.2"
GemPackage.define "ruby-mixlib-log", "1.3.0"
GemPackage.define "ruby-moneta", "0.6.0"
GemPackage.define "ruby-net-ssh", "2.1.4"
GemPackage.define "ruby-net-ssh-gateway", "1.1.0" do
  depends %w{
    net-ssh
  }.map{|g| "wavii-ruby-#{g}"}
end
GemPackage.define "ruby-net-ssh-multi", "1.0.1" do
  depends %w{
    net-ssh
    net-ssh-gateway
  }.map{|g| "wavii-ruby-#{g}"}
end
GemPackage.define "ruby-nokogiri", "1.5.0" do
  build_depends %w{
    libxml2-dev
    libxslt-dev
  }

  depends %w{
    libxml2
    libxslt1.1
  }
end
GemPackage.define "ruby-ohai", "0.6.10" do
  depends %w{
    mixlib-cli
    mixlib-config
    mixlib-log
    systemu
    yajl-ruby
  }.map{|g| "wavii-ruby-#{g}"}
end
GemPackage.define "ruby-polyglot", "0.3.3"
GemPackage.define "ruby-rake", "0.9.2.2"
GemPackage.define "ruby-rest-client", "1.6.7" do
  depends %w{
    mime-types
  }.map{|g| "wavii-ruby-#{g}"}
end
GemPackage.define "ruby-right_aws", "3.0.0" do
  depends %w{
    right_http_connection
  }.map{|g| "wavii-ruby-#{g}"}
end
GemPackage.define "ruby-right_http_connection", "1.3.0"
GemPackage.define "ruby-ruby-hmac", "0.4.0"
GemPackage.define "ruby-systemu", "2.2.0"
GemPackage.define "ruby-treetop", "1.4.10" do
  depends %w{
    polyglot
  }.map{|g| "wavii-ruby-#{g}"}
end
GemPackage.define "ruby-uuidtools", "2.1.2"
GemPackage.define "ruby-yajl-ruby", "1.1.0"
