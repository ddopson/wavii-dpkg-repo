MakefilePackage.define 'thrift' do
  description "The Apache Thrift software framework, for scalable cross-language services development, combines a software stack with a code generation engine to build services that work efficiently and seamlessly between C++, Java, Python, PHP, Ruby, Erlang, Perl, Haskell, C#, Cocoa, JavaScript, Node.js, Smalltalk, OCaml and Delphi and other languages."
  version '0.8.0'
  url lambda { "wavii-repo.s3.amazonaws.com/source/#{name}-#{version}.tar.gz" }
  build_depends %w{ flex bison gawk libtool autoconf pkg-config libevent-dev libboost-all-dev }

  # do not build w/ruby since build process is broken (wtf?!)
  configure_options '--with-ruby=no'
  build_options '' # Don't use '-j8'

  def do_build_install
    super
    broken_hfile = "#{self.install_root}/usr/local/include/thrift/Thrift.h"
    contents = File.read(broken_hfile)
    if contents.match('stdint.h')
      self.announce "WARNING: #{broken_hfile} already includes stdint.h.  The thrift recipe may be out of date"
    else
      self.cmd %Q{perl -ne 'print; m/#define _THRIFT_THRIFT_H_ 1/ and print "#include <stdint.h>\n"' -i #{broken_hfile}}
    end
  end
end
