#Given an integer between 0 and 999,999, print an English phrase that describes the integer (eg, “One Thousand, Two Hundred and Thirty Four”)

WORD_SINGLE = ["", "One ", "Two ", "Three ", "Four ", "Five ", "Six ", "Seven ", "Eight ", "Nine "]
WORD_TENS = ["", "Ten ", "Twenty ", "Thirty ", "Forty ", "Fifty ", "Sixty ", "Seventy ", "Eighty ", "Ninety "]
WORD_HUNDREDS = ["Hundred ", "Thousand", "Million"]
WORD_EXCEPTIONS = ["", "Eleven ", "Twelve ", "Thirteen ", "Forteen ", "Fifteen ", "Sixteen ", "Seventeen ", "Eighteen ", "Nineteen "]

def digits_count(num)
  num_digits = 0
  tmp = num
  while (tmp > 0)
    num_digits += 1
    tmp = tmp/10
  end
  num_digits
end

def num_to_string(num)
  puts "number = #{num}"
  return "Zero" if num == 0
  
  result = ""
  while ((count = digits_count(num)) > 3) #1000+
    base_value = (count > 6) ? 1000000 : 1000
    remainder = num % base_value
    num = num/base_value
    word_index = (base_value == 1000) ? 1 : 2
    result += num_to_string_below_thousand(num) + WORD_HUNDREDS[word_index]
    result += ", " if remainder != 0
    num = remainder
  end
  result += num_to_string_below_thousand(num) if num > 0
  result
end

def num_to_string_below_thousand(num)
  tmp = num/100
  result = ""
  if (tmp > 0)
    result += WORD_SINGLE[tmp] + WORD_HUNDREDS[0]
    result += "and " if (num%100 != 0)
  end
  tmp = num%100
  if (tmp/10 == 1 && tmp%10 != 0)
    result += WORD_EXCEPTIONS[tmp%10]
  else
    result += WORD_TENS[tmp/10]
    result += WORD_SINGLE[tmp%10]
  end
  result
end

puts num_to_string(1009)
puts num_to_string(22100)
puts num_to_string(11290)
puts num_to_string(22121)
puts num_to_string(12211)
puts num_to_string(99900)
puts num_to_string(352232)
puts num_to_string(12456000)
