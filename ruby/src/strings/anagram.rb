#check if 2 strings are anagram or not - re-arranging can result in same string or not

#Method 1: str1.chars.sort.join == str2.chars.sort.join (Sort and compare)
def anagram?(str1, str2)
  return false if str1.size != str2.size
  hash = {}
  for i in 0..str1.size-1
    hash[str1[i]] ||= 0
    hash[str1[i]] += 1
  end

  for i in 0..str2.size-1
    val = hash[str2[i]]
    return false if val.nil? || val <= 0
    hash[str2[i]] -= 1
  end

  !hash.find {|k,v|v!=0}
end
puts anagram?("ER","RE")
puts anagram?("QER","RE")
puts anagram?("QER","RES")
puts anagram?("QER","QER")
puts anagram?("QERR","QERQ")
