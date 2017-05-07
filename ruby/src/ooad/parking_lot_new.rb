#Use case - multi floor support, vehicles are assigned spots, charged when they exit
#Spots - small, medium, large. Large can fit medium and small vehicles

#Components: ParkingLot, Levels, Spots, Vehicles


class ParkingLot
  attr_accessor :levels

  NUM_SMALL_SPOTS = 100
  NUM_MEDIUM_SPOTS = 100
  NUM_LARGE_SPOTS = 100

  def initialize(num_levels)
    @levels = Array.new(num_levels)

    for i in 0..num_levels-1
      @levels[i] = ParkingLevel.new(i, [NUM_SMALL_SPOTS, NUM_MEDIUM_SPOTS, NUM_LARGE_SPOTS])
    end
  end

  def addLevel(index)
    @levels[index]
  end

  def removeLevel(index)
    if (levels[index])
      if levels[index].anyOccupiedSlot?
        raise "Error. cannot remove level as parking level is occupied"
      end
      levels[index] = nil
    end
  end

  def parkVehicle(vehicle)
    if (is_full)
      puts "Parking full"
      raise "error"
    end
    @levels.each do |level|
      spot = level.parkVehicle(vehicle)
      return spot if spot
    end
    raise "Unable to find a parking spot"
  end

  def unparkVehicle(vehicle)
    payment = vehicle.leave
    return payment
  end
private
  def is_full
    @levels.each do |level|
      return false if !level.is_full
    end
    return true
  end
end

class Spot
  :level, :number, :size, :paymentAlgo, :vehicle

  def initialize(algo=DefaultAlgo.new)
    @paymenyAlgo = algo
  end

  def add_to_free_list
    level.add_to_free_list(self)
  end
end

class Handicapped < spot
  def initialize()
    super(HandicappedAlgo.new)
  end
end

def DefaulAlgo
  attr_accessor :start_time, :end_time, :hourly_charge, :half_day_charge, :full_day_charge

  def calculate
    num_days = @end_time.day - @start_time.day)/60/60/24 # seconds to days
    if (num_days >= 1)
      return num_days * full_day_charge
    else
      num_hours = @end_time.hour - @start_time.hour
      if (num_hours > 12)
        return num_days * half_day_charge
      else
        return num_days * hourly_charge
      end
    end
    (@end_time.hour - @start_time.hour)
  end
end

class SpotSize
  SMALL = 0
  MEDIUM = 1
  LARGE = 2
  TOTAL = 3
end

class ParkingLevel
  attr_accessor :is_full, :level, :free_spots, :occupied_spots #Priority queue to give closest slot to the vehicle

  def initialize(level, num_spots_array=[])
    @level = level
    @free_spots = Array.new(SpotSize::TOTAL)
    @occupied_spots = Array.new(SpotSize::TOTAL)
    initialize_free_spots(num_spots_array)
    @is_full = false
  end

  def initialize_spots(num_spots_array)
    for spot_size in 0..num_spots_array-1
      for spot_number in 0..num_spots_array[i]-1
        @free_spots[i] = PriorityQueue.new(Spot.new(self, spot_size, spot_number))
      end
    end
  end

  def anyOccupiedSlot?
    for i in SpotSize.SMALL..SpotSize..LARGE
      return true if anyOccupiedSlot?(i)
    end
  end

  def anyOccupiedSlot?(size)
    for i in size..SpotSize::LARGE
      return true if (!@occupied_spots[i].empty)
    end
    return false
  end

  def parkVehicle(vehicle)
    for i in vehicle.slot_size..SpotSize::LARGE
      if (!@free_spots[i].empty)
        spot = @free_spots[i].dequeue
        vehicle.park(spot)
        @occupied_spots[i].enqueue(spot)
        @is_full = true if is_full
        return spot
      end
    end
    return nil
  end

  def add_to_free_list(spot)
    @occupied_spots[spot.size].remove(spot.number)
    @free_spots[spot.size].remove(spot.number)
  end
end

class Vehicle
  attr_accessor :entry_time, :spot, :spot_size, :license_number

  def initialize(size, number)
    @spot_size = size
    @license_number = number
  end

  def park(spot)
    @spot = spot
    @entry_time = Time.now
  end

  def leave
    raise "Havent assigned parking spot" unless @spot

    spot.add_to_free_list
    return spot.payment_algo.calculate      
  end
end

class Car < Vehicle
  def initialize(licenseNumber)
    super(SlotSize::SMALL, licenseNumber)
  end
end

class Van < Vehicle
  def initialize(licenseNumber)
    super(SlotSize::MEDIUM, licenseNumber)
  end
end
