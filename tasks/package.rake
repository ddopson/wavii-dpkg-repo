
def load_package(what)
  file = File.absolute_path("#{File.dirname(__FILE__)}/../packages/#{what}")
  puts "Loading package definitions from '#{file}'"
  require file
  Package::ALL
end


desc 'Download, Build, and Package one project'
task :build, [:opts] do |t, args|
  method = :do_all
  filter = /./
  ARGV[0].match /^build\[(.*)\]$/ or raise "wtf"
  opts = $1.split(',')
  puts "opts=#{opts}"

  opts.each do |opt|
    if opt.match /^:(.*)/
      method = $1.to_sym
    elsif opt.match /^\/(.*)\/$/
      filter = /#{$1}/
    else
      load_package(opt).select{|p| p.name.match(filter)}.each(&method)
    end
  end
end
