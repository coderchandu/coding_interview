#Largest string possible from given numbers
class Solution
    attr_accessor :array

    def initialize(a)
      @array = a
    end

    def do_merge_sort(first=0, last=@array.size-1)
      return if first >= last
 
      mid = (first + last)/2
      do_merge_sort(first, mid)
      do_merge_sort(mid+1, last)
      do_simple_merge(first,mid,last)
    end
 
    def do_simple_merge(first, mid, last)
      sorted_array = []
      i = first
      j = mid+1
      while (i<=mid && j<=last)
        if (@array[i].to_s + @array[j].to_s > @array[j].to_s + @array[i].to_s)
          sorted_array << @array[i]
          i += 1
        else
          sorted_array << @array[j]
          j += 1
        end
      end
      while (i<=mid)
        sorted_array << @array[i]
        i += 1
      end
      while (j<=last)
        sorted_array << @array[j]
        j += 1
      end
      for i in first..last
        @array[i] = sorted_array[i-first]
      end
    end
 
    # param a : array of integers
    # return a strings
    def largestNumber
        do_merge_sort
        str = @array.join("")
        return str
        #str = do_merge_sort(a).join("")
        i=0
        i+=1 while(i<str.size-1 && str[i] == '0')
        str[i..str.size-1]
    end
end
puts 'Expected output: "9648527226766636354854724412368319"'
puts Solution.new([ 472, 663, 964, 722, 485, 852, 635, 4, 368, 676, 319, 412 ]).largestNumber
puts 'Expected output: "99066559"'
puts Solution.new([ 9, 665, 59, 90]).largestNumber
