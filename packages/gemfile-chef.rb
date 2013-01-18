GemPackage.define "builder", "3.0.0"
GemPackage.define "bunny", "0.7.8"
GemPackage.define "chef", "0.10.2" do
  depends %w{
    wavii-ruby-bunny
    wavii-ruby-erubis
    wavii-ruby-highline
    wavii-ruby-json
    wavii-ruby-mixlib-authentication
    wavii-ruby-mixlib-cli
    wavii-ruby-mixlib-config
    wavii-ruby-mixlib-log
    wavii-ruby-moneta
    wavii-ruby-net-ssh
    wavii-ruby-net-ssh-multi
    wavii-ruby-ohai
    wavii-ruby-rest-client
    wavii-ruby-treetop
    wavii-ruby-uuidtools
  }
end
GemPackage.define "erubis", "2.7.0"
GemPackage.define "excon", "0.6.6"
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
GemPackage.define "highline", "1.6.9"
GemPackage.define "inifile", "0.4.1"
GemPackage.define "json", "1.5.2"
GemPackage.define "knife-ec2", "0.5.10" do
  depends %w{
    wavii-ruby-fog
  }
end
GemPackage.define "mime-types", "1.17.2"
GemPackage.define "mixlib-authentication", "1.1.4" do
  depends %w{
    wavii-ruby-mixlib-log
  }
end
GemPackage.define "mixlib-cli", "1.2.2"
GemPackage.define "mixlib-config", "1.1.2"
GemPackage.define "mixlib-log", "1.3.0"
GemPackage.define "moneta", "0.6.0"
GemPackage.define "net-ssh", "2.1.4"
GemPackage.define "net-ssh-gateway", "1.1.0" do
  depends %w{
    wavii-ruby-net-ssh
  }
end
GemPackage.define "net-ssh-multi", "1.0.1" do
  depends %w{
    wavii-ruby-net-ssh
    wavii-ruby-net-ssh-gateway
  }
end
GemPackage.define "nokogiri", "1.5.0" do
  build_depends %w{
    libxml2-dev
    libxslt-dev
  }

  depends %w{
    libxml2
    libxslt1.1
  }
end
GemPackage.define "ohai", "0.6.10" do
  depends %w{
    wavii-ruby-mixlib-cli
    wavii-ruby-mixlib-config
    wavii-ruby-mixlib-log
    wavii-ruby-systemu
    wavii-ruby-yajl-ruby
  }
end
GemPackage.define "polyglot", "0.3.3"
GemPackage.define "rake", "0.9.2.2"
GemPackage.define "rest-client", "1.6.7" do
  depends %w{
    wavii-ruby-mime-types
  }
end
GemPackage.define "right_aws", "3.0.0" do
  depends %w{
    wavii-ruby-right-http-connection
  }
end
GemPackage.define "right_http_connection", "1.3.0"
GemPackage.define "ruby-hmac", "0.4.0"
GemPackage.define "systemu", "2.2.0"
GemPackage.define "treetop", "1.4.10" do
  depends %w{
    wavii-ruby-polyglot
  }
end
GemPackage.define "uuidtools", "2.1.2"
GemPackage.define "yajl-ruby", "1.1.0"
VirtualPackage.define 'gemfile-chef' do
  description 'All ruby gems for Chef'
  version '0.0.1'
  depends %w{
    wavii-ruby-builder-3.0.0
    wavii-ruby-bunny-0.7.8
    wavii-ruby-chef-0.10.2
    wavii-ruby-erubis-2.7.0
    wavii-ruby-excon-0.6.6
    wavii-ruby-fog-0.8.2
    wavii-ruby-formatador-0.2.1
    wavii-ruby-highline-1.6.9
    wavii-ruby-inifile-0.4.1
    wavii-ruby-json-1.5.2
    wavii-ruby-knife-ec2-0.5.10
    wavii-ruby-mime-types-1.17.2
    wavii-ruby-mixlib-authentication-1.1.4
    wavii-ruby-mixlib-cli-1.2.2
    wavii-ruby-mixlib-config-1.1.2
    wavii-ruby-mixlib-log-1.3.0
    wavii-ruby-moneta-0.6.0
    wavii-ruby-net-ssh-2.1.4
    wavii-ruby-net-ssh-gateway-1.1.0
    wavii-ruby-net-ssh-multi-1.0.1
    wavii-ruby-nokogiri-1.5.0
    wavii-ruby-ohai-0.6.10
    wavii-ruby-polyglot-0.3.3
    wavii-ruby-rake-0.9.2.2
    wavii-ruby-rest-client-1.6.7
    wavii-ruby-right-aws-3.0.0
    wavii-ruby-right-http-connection-1.3.0
    wavii-ruby-ruby-hmac-0.4.0
    wavii-ruby-systemu-2.2.0
    wavii-ruby-treetop-1.4.10
    wavii-ruby-uuidtools-2.1.2
    wavii-ruby-yajl-ruby-1.1.0
  }
end
