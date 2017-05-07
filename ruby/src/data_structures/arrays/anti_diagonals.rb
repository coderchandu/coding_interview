#Give a N*N square matrix, return an array of its anti-diagonals. Look at the example for more details.

class Solution
    attr_accessor :a

    def initialize(a)
      @a = a
    end

    # param a : array of array of integers
    # return a array of array of integers
    def diagonal
        result = []
        i = 0
        j = 0
        while (i < @a.size && j < @a.size)
          arr = []
          row = i
          col = j
          while (row<@a.size && col>=0)
            arr << @a[row][col]
            row += 1
            col -= 1
          end
          result << arr
          i = i+1 if j==@a.size-1
          j = j+1 if j!=@a.size-1
        end
        result
    end
 
   #i+j = same for all diagonal elements
   def anti_diagonal_1
     result = Array.new(@a.size + @a.size - 1) { [] } #num_rows + num_cols - 1 (-1 since last element of 1st row is considered twice)

     for i in 0..@a.size-1
       for j in 0..@a[i].size-1
         result[i+j] << @a[i][j]
       end
     end
     result
   end
end

arr = Solution.new([
  [1,2,3],
  [4,5,6],
  [7,8,9]
]).anti_diagonal_1

puts "Expecting => [ 
  [1],
  [2, 4],
  [3, 5, 7],
  [6, 8],
  [9]
]"
for i in 0..arr.size-1
  for j in 0..arr[i].size-1
    print arr[i][j], " "
  end
  puts
end

arr = Solution.new([[1,2],[3, 4]]).anti_diagonal_1
puts "Expecting => [
  [1],
  [2, 3],
  [4]
]"
for i in 0..arr.size-1
  for j in 0..arr[i].size-1
    print arr[i][j], " "
  end
  puts
end


