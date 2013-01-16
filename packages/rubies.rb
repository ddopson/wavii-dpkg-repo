class Rubies < VirtualPackage
  def name 
    'rubies'
  end

  def version
    '0.0.1'
  end

  def description
    'Virtual Package for all ruby ecosystem stuff needed to bootstrap a server'
  end

  def depends
    [
      'ruby',
      'ruby-bundler',
      'ruby-chef',
      'ruby-ruby-shadow',
      'ruby-inifile',
    ].map{|d| "#{PACKAGING_PREFIX}#{d}"}
  end
end
