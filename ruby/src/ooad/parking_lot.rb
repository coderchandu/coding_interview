class ParkingLot
  attr_accessor :levels

  def initialize(num_levels)
    @levels = Array.new(num_levels)
    for i in 0..num_levels-1
      @levels[i] = ParkingLevel.new(i, 100)
    end
  end

  def parkVehicle(vehicle)
    for i in 0..@levels.size-1
      return true if @levels[i].parkVehicle(vehicle)
    end
  end

  def print
    @levels.each do |level|
      puts "Level #{level} : "
      @level.print
      puts
    end
    puts
  end
end

class ParkingLevel
  SPOTS_PER_ROW = 10
  attr_accessor :level, :available_spots, :occupied_spots

  def initialize(level, num_spots)
    @level = level
    @available_spots = Array.new(3) #Priority Queues for each spot types here is better to always return the closest spot from entrance
    largeSpot = num_spots/3
    smallSpot = largeSpot
    mediumSpot = num_spots - (2*largeSpot)
    for i in 0..num_spots
      row = i/SPOTS_PER_ROW
      if (i<largeSpot)
        @available_spots[Size.LARGE] ||= PriorityQueue.new
        @available_spots[Size.LARGE] <<  Spot.new(self, row, i, Size.LARGE)
      elsif (i<mediumSpot)
        @available_spots[Size.MEDIUM] ||= PriorityQueue.new
        @available_spots[Size.MEDIUM] = Spot.new(self, row, i, Size.MEDIUM)
      else
        @available_spots[Size.SMALL] ||= PriorityQueue.new
        @available_spots[Size.SMALL] = Spot.new(self, row, i, Size.SMALL)
      end
    end
    @occupied_spots = Array.new
  end

  def parkVehicle(vehicle)
    for i in vehicle.type..Size.LARGE
      if @available_spots[i]
        spot = @available_spots[i].dequeue
        spot.park(vehicle)
        return @occupied_spots.enqueue(spot)
      end
    end
    false
  end

  def findAvailableSpots(vehicle)
    for i in vehicle.type..Size.LARGE 
      return @available_spots[i].peek if @available_spots[i]
    end
  end
end

class Size
  SMALL = 0
  MEDIUM = 1
  LARGE = 2
end

class Spot
  attr_accessor :vehicle, :spotSize, :level, :row, :spotNumber

  def initialize(level, row, spotNumber, spotSize)
    @level = level
    @row = row
    @spotSize = spotSize
  end

  def isAvailable
    @vehicle.nil?
  end

  def park(vehicle)
    @vehicle = vehicle
  end

  def unpark(vehicle)
    return false unless vehicle == @vehicle
    @vehicle = nil
  end
end

class Vehicle
  attr_accessor :license_number, :type

  def initialize(number, type)
    @license_number = number
    @type = type
  end
end

class Car
  def initialize(number)
    super(number, Size::SMALL)
  end
end
