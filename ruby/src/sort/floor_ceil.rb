#Floor and ceil of sorted array for a given element
# Floor of 5 in 1,2,7 is 2 (highest elemen smaller than or equal to given number)
def floor(a, num)
  low = 0
  high = a.size-1
  while (low <= high)
    mid = (low + high)/2
    return a[mid] if a[mid] == num
    if (a[mid] < num)
      return a[mid] if mid==a.size-1 || (mid+1<a.size &&  a[mid+1] > num)
      low =  mid+1
    else
      high = mid-1 
    end
  end
end

def ceil(a, num)
  low = 0
  high = a.size-1
  while (low <= high)
    mid = (low + high)/2
    return a[mid] if a[mid] == num
    if (a[mid] < num)
      return a[mid+1] if (mid+1<a.size &&  a[mid+1] > num)
      low =  mid+1
    else
      return a[mid] if mid==0
      high = mid-1 
    end
  end
end

def floor_n_ceil(a, num)
  puts "arr=#{a}, num=#{num}"
  puts "floor_n_ceil = #{floor(a,num)}"
  puts "ceil = #{ceil(a,num)}"
end

floor_n_ceil([],3)
floor_n_ceil([1,2,3],4)
floor_n_ceil([1,2,3],2)
floor_n_ceil([1,2,3],1)
floor_n_ceil([1,2,3],3)
floor_n_ceil([1,3,5],4)
floor_n_ceil([1,3,5,7],4)
floor_n_ceil([1,2,3],0)
