#Find permutations of s within b

#find s=abbc in b=babcabb => 1st 4 itself



def permut_sub_strings(b, s)
  hash = {}
  permutations(s).each do |str|
    hash[str] = true
  end
  for i in 0..b.size-s.size
    if (hash.key?(b[i..i+s.size]))
      return true
    end
  end
end
