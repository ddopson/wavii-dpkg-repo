#!/usr/bin/env ruby

require './lib/backcompat'

V = {}
D = {}
Exclude = []
class String
  def name_filt
    self.gsub('_', '-')
  end
end

gem = ''
ARGF.each_with_index do |line, idx|
  if line.match /^    ([\w-]+) \(([\w.]+)\)/
    V[$1] = $2
    gem = $1
  elsif line.match /^      ([\w-]+)/
    (D[gem] ||= []).push($1.name_filt)
  elsif line.match /^  remote:.*\/(\w+)(\.git|\/)?/
    Exclude << $1
  elsif line.match /^    /
    raise "Match FAIL: #{line}"
  end
end

V.each do |k, v|
  str = %Q{GemPackage.define "#{k}", "#{v}"}
  d = Array(D[k])
  if d.size > 0
    str << " do\n"
    str << "  depends %w{\n"
    d.uniq.sort.each do |k|
      if Exclude.include? k
        str << "    #wavii-ruby-#{k}\n"
      else
        str << "    wavii-ruby-#{k}\n"
      end
    end
    str << "  }\n"
    str << "end"
  end
  if Exclude.include? k
    str.gsub!(/^/, '#')
  end
  puts str
end

puts "VirtualPackage.define 'gemfile-??' do"
puts "  description 'All ruby gems for ????'"
puts "  #version '0.0.1'"
puts "  depends %w{"
V.each do |k, v|
  if Exclude.include? k
    puts "    #wavii-ruby-#{k}-#{v}"
  else
    puts "    wavii-ruby-#{k}-#{v}"
  end
end
puts "  }"
puts "end" 

