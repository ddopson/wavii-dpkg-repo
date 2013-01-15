require './config'

Dir[File.expand_path('../lib/**.rb', __FILE__)].each {|t| load t}
Dir[File.expand_path('../tasks/**/*.rake', __FILE__)].each {|t| load t}
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

ARCH = case `uname -m`.strip
  when 'i686' then 'i386'
  when 'x86_64' then 'amd64'
  else raise "Unknown ARCH string '#{`uname -m`}'"
end

BASE_DIRECTORY = File.expand_path(File.dirname(__FILE__))

unless File.exists? "#{BASE_DIRECTORY}/tmp"
  Dir.mkdir "#{BASE_DIRECTORY}/tmp", 0700
end

puts "ARCH=#{ARCH}"
puts "BASE_DIRECTORY=#{BASE_DIRECTORY}"

