
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
  pkg = clazz.new

  puts "Hello #{pkg.name} and #{pkg.version}"

end

task :update_metadata do |t, args|
  chdir 's3-repo' do
    cmd = '('
    cmd << "dpkg-scanpackages dists/#{DIST_PATH}/binary-all/; "
    cmd << "dpkg-scanpackages dists/#{DIST_PATH}/binary-#{ARCH}"
    cmd << ')'
    cmd << " | bzip2 > dists/#{DIST_PATH}/binary-#{ARCH}/Packages.bz2"
    sh cmd

    File.write(LISTFILE, "deb http://#{S3_BUCKET}.s3.amazonaws.com #{DIST_PATH.gsub('/', ' ')}")
  end
end

desc 'Push new packages and metadata to S3'
task :sync, [:delete] => :update_metadata do |t, args|
  cmd = "s3cmd sync --recursive"
  cmd << " --multipart-chunk-size-mb=100" # bigger chunk size for less hassle
  cmd << " --acl-public"   # downloads don't require auth
  cmd << " --no-check-md5" # speed things up a bit
  #cmd << " --skip-existing" # aggressively skip files
  cmd << " s3-repo/ s3://#{S3_BUCKET}/"
  sh cmd
end


