#[3,4,5] with [4,6,7] => [3,4,5,6,7]
def union(a,b)
  h = {}

  if (a.size < b.size)
    min = a
    max = b.dup
  else
    min = b
    max = a.dup
  end
  
  for i in 0..a.size-1
    h[a[i]] = true
  end
  for i in 0..b.size-1
    max << b[i] if !h.key?(b[i])
  end
  max
end

puts union([3,5,4,7], [6,4,7])
