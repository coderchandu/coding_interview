#You are in an infinite 2D grid where you can move in any of the 8 directions :
#You are given a sequence of points and the order in which you need to cover the points. Give the minimum number of steps in which you can achieve it. You start from the first point.

#Input x-axis array and y-axi array Eg: Input : [(0, 0), (1, 1), (1, 2)]
#Output : 2

# It takes 1 step to move from (0, 0) to (1, 1). It takes one more step to move from (1, 1) to (1, 2).

#Solution: From (x1,y1) to (x2,y2) => Move diagonally if both x2 and y2 are greater than x1 and y1(or vice vers)
# If not move the differnce of other co-ordinate if x1==x2 or y1==y2

class MinSteps
    # param a : array of integers
    # param b : array of integers
    #return an integer
    def coverPoints(a, b)
      return 0 if a.nil? || b.nil? || a.size!=b.size
      min_steps = 0
      for i in 1..a.size-1
        min_steps += [(a[i]-a[i-1]).abs, (b[i]-b[i-1]).abs].max
      end
      min_steps
    end
end

puts MinSteps.new.coverPoints([0,1,1], [0,1,2])
