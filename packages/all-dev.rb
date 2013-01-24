
VirtualPackage.define 'all-dev' do
  version '0.0.3'
  description 'Virtual Package for all dev packages needed for compilation'

  depends %w{
    #-general
    build-essential
    wget
    unzip zip
    curl
    libboost-all-dev
    wavii-sparsehash

    #-git
    libcurl4-gnutls-dev
    libexpat1-dev
    gettext
    libz-dev
    libssl-dev
    asciidoc
    docbook2x

    #-ruby
    libc6-dev
    libssl-dev
    libmysql++-dev
    libsqlite3-dev
    libssl-dev
    libreadline6-dev
    libyaml-dev
    zlib1g-dev

    #-ruby-nokogiri
    libxml2-dev
    libxslt-dev

    #-website
    libmysqlclient-dev
    bison
    openssl
    libreadline-dev
    curl
    git-core
    zlib1g
    zlib1g-dev
    libssl-dev
    libsqlite3-0
    libsqlite3-dev
    sqlite3
    libxml2-dev
    libmysqlclient-dev
    libxslt1-dev
    default-jre
    memcached
    libsasl2-2
    libsasl2-dev

    #-java
    openjdk-6-jdk

    #-activity
    libevent-dev
    python-dev
    python-mysqldb
    python-lxml
    libsnappy-dev

    #-fds
    python-nltk
    libxml2-dev
    libxslt1-dev
    libjpeg62-dev
    libpng12-dev
    libtiff4-dev
    libjasper-dev
    zlib1g-dev

  }.reject{|d| d.match /^#/}.uniq
end
