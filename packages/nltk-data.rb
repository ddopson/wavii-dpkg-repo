MakefilePackage.define 'nltk-data' do
  description 'The NLTK data payloads - corpora, taggers, tokenizers'
  version '0.0.3'
  url lambda { "wavii-repo.s3.amazonaws.com/source/#{name.gsub('-', '_')}-#{version}.tar.gz" }

  def do_build
    target_path = "#{self.install_root}/usr/local/share/nltk_data"
    self.announce "Copying corpora contents from '#{self.source_dir}'"
    FileUtils.mkdir_p target_path
    self.cmd "cp -R '#{self.source_dir}'/* #{target_path}/"
  end
end
