class Foo
  def self.define (pkg_name, &block)
    c = Class.new(self, &block)
    c.send :define_method, :name, lambda { pkg_name }
    Kernel.const_set pkg_name.to_s, c
  end

  def self.declare_properties(hash)
    hash.each do |sym, default|
      self.send :define_method, sym do
        if default == :required
          raise "'#{sym.to_s}' must be defined"
        end
        default
      end

      self.define_singleton_method(sym) do |str=nil|
        if block_given?
        #str.is_a? Proc
          self.send :define_method, sym, str
        else
          self.send :define_method, sym, lambda { str }
        end
      end
    end
  end

  self.declare_properties(
    :foo => 9,
    :bar => :required,
  )
end

Foo.define 'Monkey' do
  foo 89
  bar lambda { 99 }
end

m = Foo::Monkey.new
puts m.bar
puts m.foo
puts m.name
