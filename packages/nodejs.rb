class Nodejs < MakefilePackage
  def name
    'nodejs'
  end

  def description
    "Node.js is Google V8 JavaScript with an evented I/O based interface to POSIX.  This RPM was built using the scripts located at https://github.com/ddopson/nodejs-rpm-builder"
  end

  def version
    '0.8.16'
  end

  def url
    "http://nodejs.org/dist/v#{version}/node-v#{version}.tar.gz"
  end

  def depends
    'openssl'
  end

  def provides
    ['node', 'npm']
  end
end
