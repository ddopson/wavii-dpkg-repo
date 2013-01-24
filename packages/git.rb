
MakefilePackage.define 'git' do
  version '1.8.1.1'
  description 'The Git version control system'
  url "http://git-core.googlecode.com/files/git-#{self.version}.tar.gz"
  provides %w{ git wavii-git git-core git-doc git-svn git-gui gitk }
  replaces %w{ git git-core git-doc git-svn git-gui gitk }
end
