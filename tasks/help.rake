desc 'Print Help Menu'
task :help do
  puts `rake -T`
end

task :default => :help


