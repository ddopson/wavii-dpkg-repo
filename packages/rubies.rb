
VirtualPackage.define 'rubies' do
  version '0.0.1'
  description 'Virtual Package for all ruby ecosystem stuff needed to bootstrap a server'

  depends [
    'ruby',
    'ruby-bundler',
    'ruby-chef',
    'ruby-ruby-shadow',
    'ruby-inifile',
  ].map{|d| "#{PACKAGING_PREFIX}#{d}"}
end
