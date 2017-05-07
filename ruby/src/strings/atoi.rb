# Given integer represented in string, print its value
#"324" => 324
#"-234" => -234
def atoi(str)
  value = 0
  sign_value = 1
  i = 0
  i+=1 while (str[i] == " ")
  if (str[i] == "-" || str[i] == "+")
    sign_value = -1 if str[i] == "-"
    i+=1
  end
  for j in i..str.size-1
    raise "Not an integer" if str[j]<'0' || str[j]>'9'
    value = (value*10) + (str[j].ord-'0'.ord)
  end
  value * sign_value
end

#decimal string to decimal
def atof(str)
  value = 0.0
  pow = 0
  multiplier = 10
  sign_value = 1
  i = 0
  i+=1 while (str[i] == " ")
  if (str[i] == "-" || str[i] == "+") 
    sign_value = -1 if str[i] == "-"
    i+=1
  end
  for j in i..str.size-1
    if str[j] == "."
      raise "Invalid number" if pow!=0
      pow = 1
      next
    end
    raise "Not an decimal #{str[j]}" if str[j]<'0' || str[j]>'9'
    value = (value*multiplier) + (str[j].ord-'0'.ord)
    pow = pow * 10
  end
  result = value * sign_value
  result /= pow if pow != 0
  result
end

puts atof("+234")
puts atof("234")
puts atof("2.34")
puts atof("ab") rescue puts "Not an integer"
puts atof("0.12")
puts atof("123424")
puts atof("  -122.02")
