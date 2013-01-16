
desc 'Print Help Menu'
task :help do
  puts `rake -T`
end

task :default => :help

desc 'Download, Build, and Package one project'
task :build, [:package_name] do |t, args|
  package_name = args[:package_name]
  require "#{File.dirname(__FILE__)}/../packages/#{package_name}"
  clazz = Kernel.const_get package_name.camelize
  pkg = clazz.new

  pkg.do_all
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

desc 'Pull the latest S3 Repo contents locally'
task :pull do |t, args|
  FileUtils.mkdir_p 's3-repo'
  cmd = "s3cmd sync --recursive"
  cmd << " --no-check-md5" # speed things up a bit
  cmd << " s3://#{S3_BUCKET}/ s3-repo/"
  sh cmd
end

desc 'Push new packages and metadata to S3'
task :push, [:delete] => :update_metadata do |t, args|
  cmd = "s3cmd sync --recursive"
  #cmd << " --multipart-chunk-size-mb=100" # bigger chunk size for less hassle
  cmd << " --acl-public"   # downloads don't require auth
  cmd << " --no-check-md5" # speed things up a bit
  #cmd << " --skip-existing" # aggressively skip files

  if args[:delete] == 'hard'
    cmd << " --delete-removed"
  end
  cmd << " s3-repo/ s3://#{S3_BUCKET}/"
  sh cmd
end

