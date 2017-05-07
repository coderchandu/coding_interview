#Given a sentence, reverse words
#This is world => world is This

#Step 1 => Reverse sentence => dlrow si sihT
#Step 2 => Reverse each words in the sentence
def reverse(sentence)
  reversed_str = reverse_str(sentence)
  output = ""
  i = 0
  while (i < reversed_str.size)
    next if (reversed_str[i] == ' ')
    
    word = ""
    while (i < reversed_str.size && reversed_str[i] != ' ')
      word << reversed_str[i]
      i += 1
    end
    output << " " if output != ""
    output << reverse_str(word)
    i += 1
  end
  output
end

def reverse_str(str)
  j = str.size-1

  for i in 0..((str.size-1)/2)
    tmp = str[i]
    str[i] = str[j]
    str[j] = tmp
    j -= 1
  end
  str
end

puts reverse("This is world")
puts reverse("This")
