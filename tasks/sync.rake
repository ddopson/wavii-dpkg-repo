def update_metadata
  chdir 's3-repo' do
    cmd = '('
    cmd << "dpkg-scanpackages dists/#{DIST_PATH}/binary-all; "
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
  cmd = "s3cmd sync --recursive --acl-public"
  cmd << " s3://#{S3_BUCKET}/ s3-repo/"
  sh cmd
end

desc 'Push new packages and metadata to S3'
task :push, [:opt] do |t, args|
  unless args[:opt] == 'dry'
    update_metadata
  end
  cmd = "s3cmd sync --recursive --acl-public"

  if args[:opt] == 'hard'
    cmd << " --delete-removed"
  end
  if args[:opt] == 'dry'
    cmd << " --dry-run"
  end
  cmd << " s3-repo/ s3://#{S3_BUCKET}/"
  sh cmd
end


