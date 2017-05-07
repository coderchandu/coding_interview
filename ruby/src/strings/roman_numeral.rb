#The point of this exercise is to provide a method of converting from Ruby Integer types to String Roman Numeral representation.

#roman numeral values are defined as:

#I = 1
#V = 5
#X = 10
#L = 50
#C = 100
#D = 500
#M = 1000

#You can combine letters to add values by listing them largest to smallest from left to right:

#II = 2
#VIII = 8
#XXXI = 31

#You may list only three consecutive identical letters. A single lower value may precede a larger value to indicate subtraction. For example:

#IV = 4
#IX = 9
#XL = 40
#XC = 90
#CD = 400
#CM = 900
class RomanNumeral
  ROMAN_NUMBERS = {
    1000 => "M",  
     900 => "CM",  
     500 => "D",  
     400 => "CD",
     100 => "C",  
      90 => "XC",  
      50 => "L",  
      40 => "XL",  
      10 => "X",  
        9 => "IX",  
        5 => "V",  
        4 => "IV",  
        1 => "I",  
  }

  def to_roman(n)
    roman = ""
    ROMAN_NUMBERS.each do |value, letter|
      roman << letter*(n / value)  #3000 => M*3 => MMM
      n = n % value
    end
    return roman
  end

  def to_decimal(roman)
    number = 0
    index = 0
    ROMAN_NUMBERS.invert.each do |letter, value|
      while (index+letter.size-1 < roman.size && roman[index..index+letter.size-1] == letter)
        number += value
        index += letter.size
      end
      break if index >= roman.size
    end
    raise unless index >= roman.size
    number
  end
end

puts RomanNumeral.new.to_roman(3000)
puts RomanNumeral.new.to_roman(343)
puts RomanNumeral.new.to_roman(6)
puts RomanNumeral.new.to_roman(15)


puts RomanNumeral.new.to_decimal("MMM")
puts RomanNumeral.new.to_decimal("CCCXLIII")
puts RomanNumeral.new.to_decimal("VI")
puts RomanNumeral.new.to_decimal("XV")
