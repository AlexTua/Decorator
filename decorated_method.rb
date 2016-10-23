require './decorators.rb'

class C
  extend Decorators

  Add_prefix.new("1 ")
  Add_prefix.new("2 ")
  Add_suffix.new(" 1")
  Add_suffix.new(" 2")
  def a
    'from a'
  end

  def b
    'from b'
  end

  Add_prefix.new("prefix ")
  Add_suffix.new(" suffix")
  def c
    'from c'
  end
end

obj = C.new

puts obj.a # 2 1 from a 1 2
puts obj.b # from b
puts obj.c # prefix from c suffix
