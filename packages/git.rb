
MakefilePackage.define 'git' do
  version '1.8.1.1'
  description 'The Git version control system'
  url "http://git-core.googlecode.com/files/git-#{self.version}.tar.gz"
  provides %w{ git wavii-git git-core git-doc git-svn git-gui gitk }
  replaces %w{ git           git-core git-doc git-svn git-gui gitk }
  depends %w{ liberror-perl libcurl3-gnutls libexpat1 zlib1g perl-modules }
  build_options "-j8 all doc info"
  install_options "install-doc install-html install-info"
  build_depends %w{
    libcurl4-gnutls-dev
    libexpat1-dev
    gettext
    libz-dev
    libssl-dev
    asciidoc
    docbook2x
  }
end
