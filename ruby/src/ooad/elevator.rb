#Design elevator system

#Requirements: mulitple elevator
#Use cases

#User presses up or down button from a floor and one elevator takes the request
#User gets into elevator and presses the destination floor

#Elevator going down takes only requests from floors down to it
#Elevator going up takes only requests from floors above it

#On user request, if there is a moving elevator in its direction, that one picks up request if not full
#Otherwise, the closes stationary elevator pick up the request

#Event driven - Each button press results in an elevatorRequest

class ElevatorRequest
  UP = 1
  DOWN = 2
  attr_accessor :type, :direction, :srcFloor, :dstFloor
end

class ElevatorHandler
  NUM_ELEVATORS = 3

  attr_accessors :free_elevators, :elevators

  def initialize
    @free_elevators = PriorityQueue.new
    for i in 0..NUM_ELEVATORS
      elevator = Elevator.new(i+1)
      @elevators << elevator
      @free_elevators.enqueue(elevator)
    end
  end

  def onFloorEntry(elevator_id, floor)
    @elevators[elevator_id].onFloorEntry(floor)
  end

  def handleUserRequest(floor, direction)
    @free_elevators.dequeue(floor) #Priority closest 
  end

  def addElevator(elevator)
    @free_elevators.enqueue(elevator)
  end

  def removeElevator(elevator)
    removed_elevator = @free_elevators.remove(eleavtor)
    raise "Elevator is not free" if (!removed_elevator)
    elevators.remove(elevator)
  end
end

class Direction
  STILL = 0
  GOING_UP = 1
  GOING_DOWN = 2
end

class Elevator
  DEFAULT_FLOOR = 0

  attr_accessor :under_maintenance, :state, :currentFloor, :number, :up_queue, :down_queue, :current_queue

  def initialize(number, state=Direction::Free)
    @state = state
    @number = number
    @currentFloor = DEFAULT_FLOOR

    @up_queue = PriorityQueue.new
    @down_queue = PriorityQueue.new
    @destination_floors = PriorityQueue.new # We always want to stop at next closest floor. If elevator is in 4th floor and going up, even
      #if 100 is pressed first, and then 7, it should stop at 7 and continues to 100. So store them in priority queue
  end

  def onFloorEntry(floor)
    return if @state == Direction::STILL || @under_maintenance
    if @current_queue.peek == floor
      open_door
      sleep 5
      close_door
      @current_queue.dequeue
      if (@current_queue.empty?)
        if state == Direction::GOING_UP
          @current_queue = @up_queue.empty? ? @down_queue : @up_queue
        else
          @current_queue = @up_queue.empty? ? @down_queue : @up_queue
        end
      end
    end
    if @current_queue.empty?
      @state = Direction::STILL
    end
  end

  def addStop(floor)
    direction = (floor > @currentFloor) ? Direction::GOING_UP : Direction::GOING_DOWN
    #raise "Error" if (state == Direction::UNDER_MAINTENANCE) || (state!=Direction::FREE && direction!=state)
    raise "Error" if (state == Direction::UNDER_MAINTENANCE)
    if (direction == Direction::GOING_UP)
      @up_queue.enqueue(floor)
      @state = Direction::GOING_UP
    else
      @down_queue.enqueue(floor)
      @state = Direction::GOING_DOWN
    end
    return direction
  end
end
