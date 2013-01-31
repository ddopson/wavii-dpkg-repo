
def load_package(what)
  file = File.absolute_path("#{File.dirname(__FILE__)}/../packages/#{what}")
  puts "Loading package definitions from '#{file}'"
  require file
  Package::ALL
end


desc 'Download, Build, and Package one project'
task :build, [:opts] do |t, args|
  method = :do_all
  ARGV[0].match /^build\[(.*)\]$/ or raise "wtf"
  opts = $1.split(',')
  puts "opts=#{opts}"
  opts.each do |file|
    if file.match /^:(.*)/
      method = $1.to_sym
    else
      load_package(file).each(&method)
    end
  end
end
