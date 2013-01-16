GemPackage.define 'ruby-nokogiri' do
  version_spec '1.5.4'

  build_depends %w{
    libxml2-dev
    libxslt-dev
  }

  depends %w{
    libxml2
    libxslt1.1
  }
end
