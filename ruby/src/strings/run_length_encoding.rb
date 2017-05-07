#Given input "1 2", output "1 1 1 2" (one one, and one two)
#Given input "1 1 1 2", output "3 1 1 2" (three one, and one two)
def encode1(str)
  if (str == nil || str == "")
    return str
  end

  new_str = String.new
  j = 0
  count = 1
  char_in_focus = str[0]

  for i in 1..str.size-1
    next if str[i] == ' '
    if (str[i] == char_in_focus)
      count += 1
    else
      if (j!=0)
        new_str[j] = ' '
        j += 1
      end 
      new_str[j] = count.to_s
      new_str[j+1] = ' '
      new_str[j+2] = char_in_focus
      j += 3
      char_in_focus = str[i]
      count = 1
    end
  end

  if (j!=0)
    new_str[j] = ' '
    j += 1
  end
  new_str[j] = count.to_s
  new_str[j+1] = ' '
  new_str[j+2] = char_in_focus
  new_str
end

def encode(str)
  i = 0
  new_str = ""
  while (i < str.size)
    if (str[i] == ' ')
      i += 1
      next
    end
    count = 1
    num_spaces = 0
    for j in i+1..str.size-1
      next if str[j] == ' '
      if (str[j] == str[i])
        count += 1
        num_spaces += 1
      else
        break
      end
    end
    new_str << " " if (new_str != "")
    new_str << count.to_s << " " << str[i]
    i += count + num_spaces
  end
  new_str
end

puts "input: '', output ''"
puts encode("")
puts "input: 's', output '1s'"
puts encode("s")
puts "input: 's s', output '2s'"
puts encode("ss")
puts "input: 's s s d', output '3s1d'"
puts encode("sssd")
puts "input: 'sd d d', output '1s3d'"
puts encode("sdd d")
puts "input: 'ss sdd', output '3s2d'"
puts encode("sssdd")
puts "input: 'sS', output '1s1S'"
puts encode("sS")
