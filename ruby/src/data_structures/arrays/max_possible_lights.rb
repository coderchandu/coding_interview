#Given 2 d array with values '#', '*' and '.'
#where '.' represents empty, '#' is a wall and '*'
# is light - find point from where maximum number of lights are visible
#Wall will obstruct the light;

#    . # * *
#    * * # .
#    . . * .
#    * # * .

#A light can see other lights
def findMaxCoordinate(arr)
  rowCount = Array.new(arr.size) {|i| Array.new(arr[i].size, 0)}
  colCount = Array.new(arr.size) {|i| Array.new(arr[i].size, 0)}

  #Populate row counts
  for i in 0..arr.size-1
    count = 0
    start = 0
    for j in 0..arr[i].size-1
      if (arr[i][j] == '#')
        #Fill row counts
        for k in start..j-1 
          rowCount[i][k] = count 
        end
        start = j+1
        count = 0
        next
      end
      count += 1 if (arr[i][j] == '*') #light
    end
    for k in start..arr[i].size-1
      rowCount[i][k] = count
    end
  end
  #Populate col counts
  for j in 0..arr[0].size-1
    count = 0
    start = 0
    for i in 0..arr.size-1
      if (arr[i][j] == '#')
        for k in start..i-1 #Fill col counts
          colCount[k][j] = count 
        end
        start = i+1
        count = 0
        next
      end
      count+=1 if (arr[i][j] == '*') #light
    end
    for k in start..arr.size-1
      colCount[k][j] = count
    end
  end

  for i in 0..arr.size-1
    for j in 0..arr[i].size-1
      print rowCount[i][j], " "
    end
    puts
  end
  puts "========"
  for i in 0..arr.size-1
    for j in 0..arr[i].size-1
      print colCount[i][j], " "
    end
    puts
  end
  maxCount = 0
  maxCoord = []
  for i in 0..arr.size-1
    for j in 0..arr[i].size-1
      sum = rowCount[i][j] + colCount[i][j]
      sum -= 1 if arr[i][j] == '*' # As a * gets considered for both row and column count.
      if (sum > maxCount)
        maxCount = sum
        maxCoord = [i,j]
      end
    end
  end
  puts "Max = #{maxCount}, co-ord=#{maxCoord.inspect}"
  maxCoord
end

val = findMaxCoordinate([['.','#','.','*'], 
                         ['.','*','#','*'], 
                         ['.','#','*','*'], 
                         ['*','#','*','.']])
