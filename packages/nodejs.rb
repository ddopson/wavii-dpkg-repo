MakefilePackage.define 'nodejs' do
  description "Node.js is Google V8 JavaScript with an evented I/O based interface to POSIX.  This RPM was built using the scripts located at https://github.com/ddopson/nodejs-rpm-builder"
  version '0.8.16'
  url lambda { "http://nodejs.org/dist/v#{version}/node-v#{version}.tar.gz" }
  depends 'openssl'
  provides ['node', 'npm']
  recommends %w{ coffee-script uglify-js mocha underscore-cli }.map{|p| "wavii-node-#{p}"}

  def do_build
    super
    self.announce "Triggering .pyc compilation"
    self.cmd "#{self.install_root}/usr/local/bin/node-waf --version"
  end
end

NpmPackage.define 'coffee-script', '1.4.0'
NpmPackage.define 'uglify-js', '2.2.3'
NpmPackage.define 'mocha', '1.8.1'
NpmPackage.define 'underscore-cli', '0.2.16'

