require './decorator.rb'

module Decorators
  def method_added(method_name)
    decorator = Decorator.decorator
    return if decorator.empty?
    Decorator.delete
    decorator.each do |decorator|
      orig_method = instance_method(method_name)
      define_method(method_name) do |*args, &block|
        m = orig_method.bind(self)
        decorator.call(m, *args, &block)
      end
    end
  end
end

class Add_prefix < Decorator
  def initialize(prefix)
    @prefix = prefix
    @@decorator << self
  end
  
  def call(orig, *args, &block)
    @prefix + orig.call(*args, &block)
  end
end

class Add_suffix < Decorator
  def initialize(suffix)
    @suffix = suffix
    @@decorator << self
  end
  
  def call(orig, *args, &block)
    orig.call(*args, &block) + @suffix
  end
end
