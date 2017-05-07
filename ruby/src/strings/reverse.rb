#Reverse string     ,
def reverse(str)
  j = str.size-1
  for i in 0..((str.size/2)-1)
    tmp = str[i]
    str[i] = str[j]
    str[j] = tmp
    j-=1
  end
  puts str
end

def reverse_recurse(str, index=0)
  return if index == str.size
  reverse_recurse(str, index+1)
  print str[index]
  puts "" if index == 0
end

reverse "Reverse"
reverse "REV"
reverse "REVERSE STR"

reverse_recurse "Reverse"
reverse_recurse "REV"
reverse_recurse "REVERSE STR"
