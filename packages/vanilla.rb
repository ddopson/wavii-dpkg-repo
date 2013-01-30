
VirtualPackage.define 'vanilla' do
  version '0.0.3'
  description 'Virtual Package for all packages to put in the burned \'vanilla\' AMI'

  depends %w{
    postfix
    sysstat
    ack-grep
    mysql-client
    wavii-git
    wavii-s3cmd
    wavii-nodejs
    wavii-ruby
    wavii-gemfile-chef
    wavii-gemfile-website
    wavii-ec2-ami-tools
    wavii-ec2-api-tools
    wavii-python-distribute wavii-python-pip wavii-python-boto
  }.reject{|d| d.match /^#/}.uniq
end
