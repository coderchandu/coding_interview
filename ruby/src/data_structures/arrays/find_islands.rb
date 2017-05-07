Find number of islands in a 2D binary array where 1 represents land and 0 represents water.
 All diagonal, adjacent 1s form a single island
 For example, the below matrix contains 5 islands

 1, 1, 0, 0, 0
 0, 1, 0, 0, 1
 1, 0, 0, 1, 1
 0, 0, 0, 0, 0
 1, 0, 1, 0, 1

class FindIslands
  attr_accessor :array
  
  def initialize(array)
    @array = array
  end

  def num_islands
    @visited = Array.new(@array.size) {Array.new(@array[0].size, 0)}
    num_islands = 0 

    for i in 0..@array.size-1
      for j in 0..@array[i].size-1
       if @array[i][j] == 1 && @visited[i][j] == 0 #Not visited(if updating array is allowed just update to zero after visiting instead of this array)
          num_islands += 1
          traverse(i, j)
        end 
      end
    end
    puts num_islands
  end
  
  #dfs
  def traverse(i, j)
    @visited[i][j] = 1
    neighbors(i, j).each do |n_i, n_j|
      traverse(n_i, n_j) if @visited[n_i][n_j] == 0 && @array[i][j] == 1
    end
  end

  def neighbors(i,j)
    arr = []
    if i>=1
      arr << [i-1,j-1] if j-1>=0
      arr << [i-1,j]
      arr << [i-1,j+1] if j+1<=@array[0].size-1
    end
    arr << [i,j-1] if j-1>=0
    arr << [i,j+1] if j+1<=@array[0].size-1
    if i+1<=@array.size-1
      arr << [i+1,j-1] if j-1>=0
      arr << [i+1,j]
      arr << [i+1,j+1] if j+1>=@array[0].size-1
    end
    arr
  end
end

FindIslands.new([[1, 1, 0, 0, 0],[0, 1, 0, 0, 1],[1, 0, 0, 1, 1],[0, 0, 0, 0, 0],[1, 0, 1, 0, 1]]).num_islands
