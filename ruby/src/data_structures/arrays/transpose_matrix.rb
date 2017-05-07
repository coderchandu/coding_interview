#Transpose the matrix without extra matrix space
#for n*n
def transpose(a)
  for i in 0..a.size-1
    for j in 0..a[i].size-1
      next if i==j 
      tmp = a[i]
      a[i] = a[j]
      a[j] = tmp
    end
  end
end


