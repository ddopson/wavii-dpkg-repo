scripting_gems = [
  GemPackage.define('colored', '1.2')
]

VirtualPackage.define 'ruby-scripting-gems', '0.0.1' do
  description 'Gems that should be installed to make common scripts work'
  version '0.0.1'
  depends scripting_gems
end
