class Rubynokogiri < GemPackage
  def gem_name
    'nokogiri'
  end

  def gem_version
    '1.5.4'
  end

  def build_depends
    %w{
      libxml2-dev
      libxslt-dev
    }
  end

  def depends
    %w{
      libxml2
      libxslt
    }
  end
end
