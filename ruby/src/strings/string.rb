#Check if one string is rotation of another

def is_rotation(str1, str2)
  reutrn false if str1.size != str2.size

  (str1+str1).include?(str2)
end

puts is_rotation("waterbottle","erbottlewat")
puts is_rotation("apple","pleap")
puts is_rotation("apple","ppale")
