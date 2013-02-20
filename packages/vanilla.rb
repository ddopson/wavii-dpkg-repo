
VirtualPackage.define 'vanilla' do
  version '0.0.7'
  description 'Virtual Package for all packages to put in the burned \'vanilla\' AMI'

  depends %w{
    wavii-all-dev
    postfix
    sysstat
    ack-grep
    wavii-gnu-parallel
    mysql-client
    nginx
    wavii-git
    wavii-s3cmd
    wavii-nodejs
    wavii-ruby
    wavii-gemfile-chef
    wavii-gemfile-website
    wavii-ec2-ami-tools
    wavii-ec2-api-tools
    python-pip
    python-boto
    python-virtualenv
  }.reject{|d| d.match /^#/}.uniq
end
