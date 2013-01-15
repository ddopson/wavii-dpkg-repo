
desc 'Print Help Menu'
task :help do
  puts `rake -T`
end

task :default => :help

desc 'Some text'
task :foo, [:package_name] do |t, args|
  package_name = args[:package_name]
  require "packages/#{package_name}"
  clazz = Kernel.const_get package_name.capitalize
  inst = clazz.new

  puts "Hello #{package_name} and #{inst.version}"

end

task :update_metadata do |t, args|
  chdir 's3-repo' do
    arch="i386"
    pth="dists/wavii/main"
    sh "(dpkg-scanpackages #{pth}/binary-all/; dpkg-scanpackages #{pth}/binary-#{arch}/) | bzip2 > #{pth}/binary-i386/Packages.bz2"
  end
end

desc 'Push new packages and metadata to S3'
task :sync, [:delete] => :update_metadata do |t, args|
  cmd = "s3cmd sync --recursive"
  cmd << " --multipart-chunk-size-mb=100" # bigger chunk size for less hassle
  cmd << " --acl-public"   # downloads don't require auth
  cmd << " --no-check-md5" # speed things up a bit
  #cmd << " --skip-existing" # aggressively skip files
  cmd << " s3-repo/ s3://wavii-repo/"
  sh cmd
end


