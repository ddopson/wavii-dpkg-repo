MakefilePackage.define 'nodejs' do
  description "Node.js is Google V8 JavaScript with an evented I/O based interface to POSIX.  This RPM was built using the scripts located at https://github.com/ddopson/nodejs-rpm-builder"
  version '0.8.16'
  url lambda { "http://nodejs.org/dist/v#{version}/node-v#{version}.tar.gz" }
  depends 'openssl'
  provides ['node', 'npm']
end
