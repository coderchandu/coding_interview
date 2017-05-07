#1. Print a string of words
#2. Print string in caps, or in small
#3. Alternate words in caps


#Print string of words base class, decorate it with different possiblities

class PrintString
  def print(str)
    puts str
  end
end

class Decorator < PrintString
  attr_accessor :print_string_decorator

  def initialize(print_string_decorator)
    @print_string_decorator= print_string_decorator
  end
end

class EvenCaps < Decorator
  def print(str)
    new_words = []
    str.split.each_with_index {|s, i| new_words << ((i%2==0) ? s.upcase : s)}
    @print_string_decorator.print(new_words.join(" "))
  end
end

class OddSmall < Decorator
  def print(str)
    new_words = []
    str.split.each_with_index {|s, i| new_words << (i%2==0 ? s : s.downcase)}
    @print_string_decorator.print(new_words.join(" "))
  end
end

str = "Hellow World!"

print_obj = PrintString.new
puts "printing actual string => #{print_obj.print(str)}"

caps = EvenCaps.new(print_obj)
puts "printing even caps string => #{caps.print(str)}"
small = OddSmall.new(print_obj)
puts "printing odd small string => #{small.print(str)}"
small = OddSmall.new(caps)
puts "printing even caps and odd small string => #{small.print(str)}"
