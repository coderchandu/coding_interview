#Given N jobs where every job is represented by following three elements of it.

#Start Time
#Finish Time
#Profit or Value Associated

#Find the maximum profit subset of jobs such that no two jobs in the subset overlap

#Input: Number of Jobs n = 4
#       Job Details {Start Time, Finish Time, Profit}
#       Job 1:  {1, 2, 50} 
#       Job 2:  {3, 5, 20}
#       Job 3:  {6, 19, 100}
#       Job 4:  {2, 100, 200}
#Output: The maximum profit is 250.
#We can get the maximum profit by scheduling jobs 1 and 4.
#Note that there is longer schedules possible Jobs 1, 2 and 3 
#but the profit with this schedule is 20+50+100 which is less than 250


class Job
  attr_accessor :start_time, :end_time, :profit

  def initialize(start_t, end_t, profit)
    @start_time = start_t
    @end_time = end_t
    @profit = profit
  end

  def self.get_next_non_overlap_index(jobs, index)
    i = index-1
    while (i>=0 && jobs[index].start_time < jobs[i].end_time)
      i -= 1
    end
    return i
  end

  def self.max_profit_recurse(jobs, index)
    return 0 if (jobs == []) 
    return 0 if index < 0 
    return jobs[0].profit if (index==0)
    
    max_excluding_this_task = max_profit_recurse(jobs, index-1)
    max_including_this_task = max_profit_recurse(jobs, get_next_non_overlap_index(jobs, index)) + jobs[index].profit
    [max_excluding_this_task, max_including_this_task].max
  end

  def self.max_profit_dp(jobs)
    return 0 if (jobs == []) 
    return jobs[0].profit if jobs.size == 1
    arr = Array.new(jobs.size, nil)
    arr[0] = jobs[0].profit
   
    for i in 1..jobs.size-1
      max_incl_this_task = jobs[i].profit
      index = get_next_non_overlap_index(jobs, i)
      max_incl_this_task += arr[index] if index >= 0
      max_excl_this_task = arr[i-1]
      arr[i] = [max_excl_this_task, max_incl_this_task].max
    end
    arr[jobs.size-1]
  end

  def self.max_profit(jobs, recurse=false)
    jobs.sort! {|a,b| a.end_time <=> b.end_time }
    if recurse
      #Recursion: Sort by end time. Find max of profit incl or excl current task. For incl current task, we can avoid all overlapping tasks
      return self.max_profit_recurse(jobs, jobs.size-1)
    end
    max_profit_dp(jobs)
  end
end

jobs = [Job.new(1,2,50), Job.new(3,5,20), Job.new(6,19,100), Job.new(2,100,200)]
puts "memoize---"
puts Job.max_profit(jobs)
puts "recurse---"
puts Job.max_profit(jobs, true)

jobs = [Job.new(0,1,10), Job.new(1,2,90), Job.new(4,29,100), Job.new(2,900,900), Job.new(3,5,50), Job.new(2,2,10), Job.new(2,12,100), Job.new(2,800,100), Job.new(1,2,50), Job.new(3,5,120), Job.new(6,19,900), Job.new(2,200,100), Job.new(1,2,50), Job.new(3,5,20), Job.new(6,19,100), Job.new(2,100,200), Job.new(0,1,10), Job.new(1,2,90), Job.new(4,29,100), Job.new(2,900,900), Job.new(3,5,50), Job.new(2,2,10), Job.new(2,12,100), Job.new(2,800,100), Job.new(1,2,50), Job.new(3,5,120), Job.new(6,19,900), Job.new(2,200,100), Job.new(1,2,50), Job.new(3,5,20), Job.new(6,19,100), Job.new(2,100,200),Job.new(0,1,10), Job.new(1,2,90), Job.new(4,29,100), Job.new(2,900,900), Job.new(3,5,50), Job.new(2,2,10), Job.new(2,12,100), Job.new(2,800,100), Job.new(1,2,50), Job.new(3,5,120), Job.new(6,19,900), Job.new(2,200,100), Job.new(1,2,50), Job.new(3,5,20), Job.new(6,19,100), Job.new(2,100,200), Job.new(0,1,10), Job.new(1,2,90), Job.new(4,29,100), Job.new(2,900,900), Job.new(3,5,50), Job.new(2,2,10), Job.new(2,12,100), Job.new(2,800,100), Job.new(1,2,50), Job.new(3,5,120), Job.new(6,19,900), Job.new(2,200,100), Job.new(1,2,50), Job.new(3,5,20), Job.new(6,19,100), Job.new(2,100,200),Job.new(0,1,10), Job.new(1,2,90), Job.new(4,29,100), Job.new(2,900,900), Job.new(3,5,50), Job.new(2,2,10), Job.new(2,12,100), Job.new(2,800,100), Job.new(1,2,50), Job.new(3,5,120), Job.new(6,19,900), Job.new(2,200,100), Job.new(1,2,50), Job.new(3,5,20), Job.new(6,19,100), Job.new(2,100,200), Job.new(0,1,10), Job.new(1,2,90), Job.new(4,29,100), Job.new(2,900,900), Job.new(3,5,50), Job.new(2,2,10), Job.new(2,12,100), Job.new(2,800,100), Job.new(1,2,50), Job.new(3,5,120), Job.new(6,19,900), Job.new(2,200,100), Job.new(1,2,50), Job.new(3,5,20), Job.new(6,19,100), Job.new(2,100,200),Job.new(0,1,10), Job.new(1,2,90), Job.new(4,29,100), Job.new(2,900,900), Job.new(3,5,50), Job.new(2,2,10), Job.new(2,12,100), Job.new(2,800,100), Job.new(1,2,50), Job.new(3,5,120), Job.new(6,19,900), Job.new(2,200,100), Job.new(1,2,50), Job.new(3,5,20), Job.new(6,19,100), Job.new(2,100,200), Job.new(0,1,10), Job.new(1,2,90), Job.new(4,29,100), Job.new(2,900,900), Job.new(3,5,50), Job.new(2,2,10), Job.new(2,12,100), Job.new(2,800,100), Job.new(1,2,50), Job.new(3,5,120), Job.new(6,19,900), Job.new(2,200,100), Job.new(1,2,50), Job.new(3,5,20), Job.new(6,19,100), Job.new(2,100,200)]
puts "memoize---"
puts Job.max_profit(jobs)
puts "recurse---"
puts Job.max_profit(jobs, true)


