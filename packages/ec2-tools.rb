MakefilePackage.define 'ec2-ami-tools' do
  arch 'all'
  homepage 'http://aws.amazon.com/developertools/368'

  description "The Amazon EC2 AMI Tools are command-line utilities to help bundle an Amazon Machine Image"

  version '1.4.0.9'
  url lambda { "wavii-repo.s3.amazonaws.com/source/#{name}-#{version}.tar.gz" }
  depends "wavii-ruby"

  def do_build
    self.mkdir "#{self.install_root}/usr/local/lib/ec2-ami-tools"
    self.cmd "perl -pe 's#home=.*#home=/usr/local/lib/ec2-ami-tools#' -i #{self.source_dir}/bin/*"
    self.cmd "mv #{self.source_dir}/bin #{self.install_root}/usr/local/"
    self.cmd "mv #{self.source_dir}/etc #{self.install_root}/"
    self.cmd "mv #{self.source_dir}/* #{self.install_root}/usr/local/lib/ec2-ami-tools/"
  end
end

MakefilePackage.define 'ec2-api-tools' do
  arch 'all'
  homepage 'http://aws.amazon.com/developertools/368'

  description "The API tools serve as the client interface to the Amazon EC2 web service."

  version '1.6.6.1'
  url lambda { "wavii-repo.s3.amazonaws.com/source/#{name}-#{version}.tar.gz" }

  def do_build
    self.cmd "rm -rf  #{self.source_dir}/bin/*.cmd"
    self.cmd "perl -pe 's#__ZIP_PREFIX__EC2_HOME.*#EC2_HOME=/usr/local/lib/ec2-api-tools#' -i #{self.source_dir}/bin/*"
    self.cmd "sed -e 's#__RPM_PREFIX__EC2_HOME.*#JAVA_HOME=${JAVA_HOME:-$(dirname $(dirname $(readlink -f $(which java))))}#' -i #{self.source_dir}/bin/*"
    self.mkdir "#{self.install_root}/usr/local/lib/ec2-api-tools"
    self.mkdir "#{self.install_root}/usr/local/bin"
    self.cmd "cp #{self.source_dir}/bin/ec2-* #{self.install_root}/usr/local/bin"
    self.cmd "mv #{self.source_dir}/* #{self.install_root}/usr/local/lib/ec2-api-tools/"
  end
end
