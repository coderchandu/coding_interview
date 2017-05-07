#n=2 eggs and a building with k=36 floors.
#Suppose that we wish to know which stories in a 36-story building are safe to drop eggs from, and which will cause the eggs to break on landing
#An egg that survives a fall can be used again
#A broken egg must be discarded
#The effect of a fall is the same for all eggs
#If an egg breaks when dropped, then it would break if dropped from a higher floor
#If an egg survives a fall then it would survive a shorter fall

#What is the least number of egg-droppings that is guaranteed to work in all cases?

#Approach: DP

#Let k => Number of floors and n=> Number of eggs

#Since we need to minimize the number of trials in worst case, we take the maximum of two cases. We consider the max of above two cases for every floor and choose the floor which yields minimum number of trials

#1) If the egg breaks after dropping from xth floor, then we only need to check for floors lower than x with remaining eggs; so the problem reduces to x-1 floors and n-1 eggs
#2) If the egg doesn’t break after dropping from the xth floor, then we only need to check for floors higher than x; so the problem reduces to k-x floors and n eggs.

#eggDrop(n, k) ==> Minimum number of trails needed to find the critical
#                    floor in worst case.
#  eggDrop(n, k) = 1 + min{max(eggDrop(n - 1, x - 1), eggDrop(n, k - x)): 
#                 x in {1, 2, ..., k}}

#This has overlapping sub problems which can be avoided by storing the min values in array[][]

class EggDrop
  attr_accessor :eggTrials

  def minTryRequired(num_eggs, num_floors)
    eggTrials = Array.new(num_eggs+1) { Array.new(num_floors+1, num_floors+1) }
    #For one floor, one egg and zero floor zero eggs
    for i in 0..num_eggs
      eggTrials[i][0] = 0
      eggTrials[i][1] = 1
    end

    #For zero egg, zero; For one egg, number of floors need to be checked sequentially
    for j in 2..num_floors
      eggTrials[0][j] = 0
      eggTrials[1][j] = j
    end

    for i in 2..num_eggs
      for j in 2..num_floors
        #Find min of cases where egg is dropped in each floors till j
        for tmp in 1..j
          value = 1 + [eggTrials[i-1][tmp-1], eggTrials[i][j-tmp]].max #Max since we've to get the value of max possible steps(egg break is a possiblity and doesn't break is another possiblity)
          if (value < eggTrials[i][j])
            eggTrials[i][j] = value
          end
        end
      end
    end

    return eggTrials[num_eggs][num_floors] if num_eggs > 2
    step = eggTrials[num_eggs][num_floors]
    floorsToTry = []
    i = step
    while (step > 0 && i < num_floors)
      floorsToTry << i
      step -= 1
      i += step
    end
    floorsToTry << num_floors
    print "floors = #{floorsToTry}", "\n"
    eggTrials[num_eggs][num_floors]
  end
end

#puts EggDrop.new.minTryRequired(2, 100)
#puts EggDrop.new.minTryRequired(2, 10)
puts EggDrop.new.minTryRequired(6, 20)
