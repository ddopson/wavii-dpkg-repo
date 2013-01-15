#!/usr/bin/env ruby

class Ruby < Package
  def name
    'ruby'
  end

  def version
    '1.9.3-p362'
  end

  def url
    "http://ftp.ruby-lang.org/pub/ruby/1.9/#{self.name}-#{self.version}.tar.gz"
  end
end
