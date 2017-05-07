#Given N jobs where every job is represented by following three elements of it.
#1. Start Time
#2. Finish Time
#3. Profit or Value Associated
#Find the maximum profit subset of jobs such that no two jobs in the subset overlap

#Input:  
#Number of Jobs n = 4
#Job Details {Start Time, Finish Time, Profit}
#Job 1: {1, 2, 50}
#Job 2: {3, 5, 20}
#Job 3: {6, 19, 100}
#Job 4: {2, 100, 200}

#Output:  
#Job 1: {1, 2, 50}
#Job 4: {2, 100, 200}

class Job
  attr_accessor :start_time, :end_time, :profit, :jobs

  def initialize(arr=[], st=nil, en=nil, pr=nil)
    @start_time = st
    @end_time = en
    @profit = pr
    @jobs = arr
    print @jobs, "\n" if arr!=[]
  end

  def get_prev_non_overlap_index(i)
    index = i-1
    while (index>=0 && @jobs[i].start_time < @jobs[index].end_time)
      index -= 1
    end
    index
  end

  def max_profit_jobs
    return if @jobs.nil? || @jobs == []
    return @jobs[0].profit if @jobs.size == 1

    @jobs.sort! { |a,b| a.end_time <=> b.end_time }
    max_profits = Array.new(@jobs.size-1)
    max_task_index = Array.new(@jobs.size-1)
    max_profits[0] = @jobs[0].profit
    for i in 1..@jobs.size-1
      max_incl_this_task = @jobs[i].profit
      index = get_prev_non_overlap_index(i)
      max_incl_this_task += max_profits[index] if index >= 0
      max_excl_this_task = max_profits[i-1]
      if (max_incl_this_task > max_excl_this_task)
        max_profits[i] = max_incl_this_task
        max_task_index[i] = index
      else
        max_profits[i] = max_excl_this_task
        max_task_index[i] = i-1
      end
    end
    puts "-------------------"
    i = @jobs.size-1
    i-=1 while (i>=0 && max_task_index[i] == i)
    while i && i>=0
      puts @jobs[i].inspect
      if max_task_index[i] == i
        break
      else
        i = max_task_index[i]
      end
    end
    puts "-------------------"
    max_profits[@jobs.size-1]
  end
end

jobs = [Job.new([], 1,2,50), Job.new([], 3,5,20), Job.new([], 6,19,100), Job.new([], 2,100,200)]
puts Job.new(jobs).max_profit_jobs.inspect
