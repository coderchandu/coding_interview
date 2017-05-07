#Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).
#You may assume that the intervals were initially sorted according to their start times.

#Given intervals [1,3],[6,9] insert and merge [2,5] would result in [1,5],[6,9].
#Given [1,2],[3,5],[6,7],[8,10],[12,16], insert and merge [4,9] would result in [1,2],[3,10],[12,16].

# Make sure the returned intervals are also sorted.

class Interval
  attr_accessor :start_value, :end_value
  def initialize(start=0, end_value=0)
    @start_value = start
    @end_value = end_value
  end
end

#array of intervalue, and new interval to insert
#return array of intervals after merging
def insert(intervals, new_interval)
  possible_overlap = false
  return [new_interval] if intervals.nil? || intervals.size == 0
  for i in 0..intervals.size-1
    if intervals[i].start_value >= new_interval.start_value
     possible_overlap = true
     break
    end
  end
  
  return intervals + [new_interval] if !possible_overlap

  i -= 1
  start_index = i
  new_arr = intervals
  if (start_index < 0)
    start_index = 0
    i = 0
  end
  while (i < new_arr.size-1 && new_arr[i].start_value <= new_interval.end_value)
    i += 1
  end
  i -= 1 if i > start_index
  if new_arr[start_index].start_value > new_interval.end_value || new_arr[i].end_value < new_interval.start_value
    return new_arr.insert(i, new_interval)
  end  
  new_arr[start_index].start_value = [new_interval.start_value, new_arr[start_index].start_value].min
  new_arr[start_index].end_value = [new_interval.end_value, new_arr[i].end_value].max
  result = new_arr[0..start_index]
  i += 1
  result += new_arr[i..new_arr.size-1] if i <= new_arr.size-1
  result
end

#Given [1,2],[3,5],[6,7],[8,10],[12,16], insert and merge [4,9] would result in [1,2],[3,10],[12,16].

intervals = [Interval.new(1,2), Interval.new(3,5), Interval.new(6,7), Interval.new(8,10), Interval.new(12,16)]
new_interval = Interval.new(4,9)
puts "Intervals => #{intervals.inspect}"
puts "new=>#{new_interval.inspect}"
values = insert(intervals, new_interval)
values.each do |interval|
 print "[#{interval.start_value}, #{interval.end_value}]"
 puts
end
puts "======="

intervals = [Interval.new(3,5), Interval.new(7,9)]
new_interval = Interval.new(1,10)
puts "Intervals => #{intervals.inspect}"
puts "new=>#{new_interval.inspect}"
values = insert(intervals, new_interval)
values.each do |interval|
  print "[#{interval.start_value}, #{interval.end_value}]"
  puts
end
puts "======"

intervals = [Interval.new(3,6), Interval.new(8,19)]
new_interval = Interval.new(1,2)
puts "Intervals => #{intervals.inspect}"
puts "new=>#{new_interval.inspect}"
values = insert(intervals, new_interval)
values.each do |interval|
 print "[#{interval.start_value}, #{interval.end_value}]"
 puts
end
puts "========="

intervals = [Interval.new(1,2), Interval.new(8,10)]
new_interval = Interval.new(3,6)
puts "Intervals => #{intervals.inspect}"
puts "new=>#{new_interval.inspect}"
values = insert(intervals, new_interval)
values.each do |interval|
  print "[#{interval.start_value}, #{interval.end_value}]"
  puts
end
puts "========="
