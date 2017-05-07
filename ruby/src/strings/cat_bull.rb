#String with four values R,G,B,Y => one guess. If same position and char, its a bull, same char in 
#different position, its a cow
def num_cats_and_bulls(str, guess)
  cows = 0 
  bulls = 0
  hash = {}
  for i in 0..guess.size-1
    if (str[i] == guess[i])
      bulls += 1
    else
      hash[guess[i]] = i
    end
  end

  for i in 0..str.size-1
    if (hash[str[i]] && hash[str[i]] != i)
      cows+=1
    end
  end
  puts "cows=#{cows}, bulls=#{bulls}"
end

num_cats_and_bulls "RGGB", "YRGB"
