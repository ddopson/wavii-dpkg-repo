unless Dir.respond_to? :mktmpdir
  class Dir
    def self.mktmpdir(prefix_suffix, base)
      prefix_suffix = Array(prefix_suffix)
      prefix = prefix_suffix[0] || ''
      suffix = prefix_suffix[1] || ''
      d = "#{base}/#{prefix}#{Time.now.to_i}#{suffix}"
      Dir.mkdir(d)
      return d
    end
  end
end

unless String.new.respond_to? :strip_heredoc
  class String
    def strip_heredoc
      indent = scan(/^[ \t]*(?=\S)/).min.size
      gsub(/^[ \t]{#{indent}}/, '')
    end
  end
end

unless String.new.respond_to? :camelize
  class String
    def camelize
      self.gsub(/^.|-./){|m| m.gsub('-', '').capitalize }
    end
  end
end

