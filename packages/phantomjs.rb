MakefilePackage.define 'phantomjs' do
  description "PhantomJS is a headless WebKit with JavaScript API. It has fast and native support for various web standards: DOM handling, CSS selector, JSON, Canvas, and SVG."
  version '1.8.1'
  url lambda { "http://phantomjs.googlecode.com/files/phantomjs-#{version}-source.zip" }
  build_depends %w{ build-essential chrpath git-core libssl-dev libfontconfig1-dev }

  def do_build
    self.cmd "./build.sh", self.source_dir
  end

  def do_package
    share_dir = "#{install_root}#{install_prefix}/share/phantomjs"
    bin_dir = "#{install_root}#{install_prefix}/bin"
    self.cmd "mkdir -p #{bin_dir}"
    self.cmd "cp #{self.source_dir}/bin/* #{bin_dir}"
    self.cmd "mkdir -p #{share_dir}/examples/"
    self.cmd "cp #{self.source_dir}/examples/* #{share_dir}/examples/"
    self.cmd "cp #{self.source_dir}/CONTRIBUTING.md #{share_dir}/i"
    self.cmd "cp #{self.source_dir}/ChangeLog #{share_dir}/"
    self.cmd "cp #{self.source_dir}/LICENSE.BSD #{share_dir}/"
    self.cmd "cp #{self.source_dir}/README.md #{share_dir}/"
    super
  end
end

