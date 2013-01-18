require './lib/property-bag'

class Foo < PropertyBag
  property :foo, '99'
  property :name, 'name'
  property :bar, lambda { |x=nil,y=nil|
    puts "Hello World x=#{x}, y=#{y}"
    "foo is #{foo}"
  }
  property :bar2 do
    "foo is #{foo}"
  end
  property :bar3 do
    "foo is #{foo}"
  end
  property :bar4
end

class SuperFoo < Foo
  property :bar, lambda { |x=nil,y=nil|
    puts "Hello World x=#{x}, y=#{y}"
    "superfoo is #{foo}"
  }
  property :bar2 do
    "superfoo is #{foo}"
  end
  property :bar3 do
    "superfoo is #{foo}"
  end
end



f = SuperFoo.define 'blah' do
  bar3 'overridden'
  bar4 do
    "instance is '#{bar2}', #{@bar2}"
  end
end

puts f.bar
puts f.bar2
puts f.bar3
puts f.bar4
