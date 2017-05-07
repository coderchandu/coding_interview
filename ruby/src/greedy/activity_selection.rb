#You are given n activities with their start and finish times. Select the maximum number of activities that can be performed 
#by a single person, assuming that a person can only work on a single activity at a time

class Activity
  attr_accessor :start_time, :end_time

  def initialize(start_time, end_time)
    @start_time = start_time
    @end_time = end_time
  end

  def self.max_activities(array)
    array.sort! {|a,b| a.end_time <=> b.end_time}
    puts "#{array.inspect}"
    activities = [array[0]] #First element always gets to the list
    index = 0
    for i in 1..array.size-1
      #If no overlap, add task i to activity list
      if array[i].start_time >= array[index].end_time
        activities << array[i]
        index = i 
      end
    end
    activities
  end
end

activities = [Activity.new(1,2), Activity.new(3,4),Activity.new(0,6),Activity.new(5,7),Activity.new(8,9),Activity.new(5,9)]
puts "4 => ", Activity.max_activities(activities).inspect
activities = [Activity.new(0,6), Activity.new(1,6),Activity.new(3,6),Activity.new(1,7),Activity.new(6,9),Activity.new(5,9)]
puts "2 => ", Activity.max_activities(activities).inspect
