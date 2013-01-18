class PropertyBag

  def self.define(name, &block)
    self.new.tap do |instance|
      instance.name(name)
      instance.instance_eval(&block) if block_given?
      instance.validate!
    end
  end

  def self.property(name, *args, &block)
    ivar    = :"@#{name}"
    options = args.last.is_a?(Hash) ? args.pop : {}
    if block_given? || args.length > 0
      options[:default] = block || args.first
    end

    (@known_properties ||= {})[name] = options

    # Both a reader and a writer
    class_eval <<-end_eval, __FILE__, __LINE__
      def #{name}(*args, &block)
        if block_given? || args.length > 0
          #{ivar} = block || args.first
        end

        if #{ivar}.is_a? Proc
          self.instance_exec(&#{ivar})
        else
          #{ivar}
        end
      end
    end_eval
  end

  def self.known_properties
    @known_properties ||= {}
    if superclass.respond_to? :known_properties
      superclass.known_properties.merge(@known_properties)
    else
      @known_properties
    end
  end

  def initialize
    self.class.known_properties.each do |name, options|
      if options.has_key? :default
        v = options[:default].nil? ? nil : options[:default].dup
        instance_variable_set(:"@#{name}", v)
      end
    end
  end

  def validate!
    properties = instance_variables.map { |i| i.to_s[1..-1].to_sym }
    required   = self.class.known_properties.map { |name, options|
      name.to_sym if options[:required]
    }.compact

    missing = required - properties
    if missing.size > 0
      raise "#{self} is missing the following required properties: #{missing.inspect}"
    end
  end
end
