require './config'
require 'fileutils'


ARCH = case `uname -m`.strip
  when 'i686' then 'i386'
  when 'x86_64' then 'amd64'
  else raise "Unknown ARCH string '#{`uname -m`}'"
end

BASE_DIRECTORY = File.expand_path(File.dirname(__FILE__))

Dir[File.expand_path('../tasks/**/*.rake', __FILE__)].each {|t| load t}
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'backcompat'
require 'property-bag'

require 'package'
require 'downloadable-package'
require 'makefile-package'
require 'gem-package'
require 'npm-package'
require 'virtual-package'

puts "ARCH=#{ARCH}"
puts "BASE_DIRECTORY=#{BASE_DIRECTORY}"


