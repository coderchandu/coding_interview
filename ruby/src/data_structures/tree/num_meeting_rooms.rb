require 'time'
require './tree.rb'

#Given a set of meeting times, and a start and end time of new meeting
#return all the meeting rooms available during that time

class BinarySearchTree < Tree
  def insert_node_to_bst(meeting)
    node = Node.new(meeting)
    unless @root
      @root = node
      return node
    end
    ptr = @root
    parent = nil
    while (ptr != nil)
      parent = ptr
      ptr = (meeting.start_time < ptr.data.start_time) ? ptr.left : ptr.right
    end
    if (meeting.start_time < parent.data.start_time)
      parent.left = node
    else
      parent.right = node
    end
    node.parent = parent
    node
  end

  def find_node_to_check(start_time)
    ptr = root
    parent = root
    while (ptr)
      parent = ptr
      return ptr if start_time == ptr.data.start_time
      if (start_time > ptr.data.start_time)
        ptr = ptr.right
      else
        ptr = ptr.left
      end
    end
    parent
  end
end

class Building
  attr_accessor :meeting_rooms
 
  def initialize
    @meeting_rooms = []
  end

  def get_available_rooms(start_time, end_time)
    return [] if start_time >= end_time
    meeting_rooms.select {|room| room.available?(start_time, end_time)}
  end

  def add_meeting_room(room)
    @meeting_rooms << room
  end
end

class MeetingRoom
  attr_accessor :meetings, :name

  def initialize(name)
    #@meetings = []
    @meetings = BinarySearchTree.new
    @name = name
  end

  def add_meeting(meeting)
    if meeting.start_time >= meeting.end_time || meeting.start_time.hour < 9 || meeting.end_time.hour > 18 #9am-6pm
      puts "Invalid meeting timings"
      return nil
    end
    unless available?(meeting.start_time, meeting.end_time)
      puts "Meeting room #{@name} not available for #{meeting.start_time} and #{meeting.end_time}"
      return
    end
    @meetings.insert_node_to_bst(meeting)
  end

  def available?(start_time, end_time)
    possible_overlap_node = @meetings.find_node_to_check(start_time)
    overlapping_meeting = possible_overlap_node.data if possible_overlap_node
    return true unless overlapping_meeting
    if (overlapping_meeting.start_time >= end_time || overlapping_meeting.end_time <= start_time)
      return true
    else
      return false
    end

    #overlapping_meeting = @meetings.find do |meeting|
    #  !(start_time > meeting.end_time || end_time < meeting.start_time)
    #end
    #overlapping_meeting.nil?
  end
end

class Meeting
  attr_accessor :start_time, :end_time

  def initialize(start_time, end_time)
    @start_time = start_time
    @end_time = end_time
  end
end

building = Building.new
for i in 1..10
  building.add_meeting_room(MeetingRoom.new("Room #{i}"))
end

meeting_room = building.meeting_rooms[0]
meeting_room.add_meeting(Meeting.new(Time.parse("2016-11-09 10:00"), Time.parse("2016-11-09 11:00")))
meeting_room.add_meeting(Meeting.new(Time.parse("2016-11-09 10:30"), Time.parse("2016-11-09 11:30")))
meeting_room.add_meeting(Meeting.new(Time.parse("2016-11-09 11:00"), Time.parse("2016-11-09 11:30")))
meeting_room = building.meeting_rooms[1]
meeting_room.add_meeting(Meeting.new(Time.parse("2016-11-09 11:00"), Time.parse("2016-11-09 11:30")))

puts building.get_available_rooms(Time.parse("2016-11-09 10:00"), Time.parse("2016-11-09 10:01")).inspect
