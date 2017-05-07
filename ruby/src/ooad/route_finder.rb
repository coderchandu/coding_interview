#We want to provide tourist an easy way to find tourist places in the city
#We should store full network of subway lines. as well as all the stations
#Given a start and destination station, find route indicating which lines to 
#take, which stations are passed and about the connections


#Feature List(Requirements)
#==========================
# 1) Represent subway lines and stations along the line
# 2) Represent stations with train lines passing through them
# 3) Places should indicate nearest stations
# 4) Given a src and desination stations, find route between them and print it

#Use Case Diagram
#==================

# 1) User => Src station => Destination place return the details
# 2) Administrator => Load network of subway lines, stations etc. Make updates

#Components
#============

#Station indicates train lines which passes through
#Line which has a list of stations

class RouteController
  attr_accessor :trainLines, :stationMap

  def initialize
    @stationMap = {} #station map stores station name and lines it passes through
  end

  def addTrainLines(trainLine)
    @trainLines ||= []
    @trainLines << trainLine
  end

  def addStation(line, prevStation, station)
    line.addStation(prevStation, station)
    
  end

  def find_route(srcStation, destination)
    possibleStartingLines = []
    possibleEndingLines = []
    trainLines.each do |line|
      possibleStartingLines << line if line.hasStation(srcStation)
    end
    
    trainLines.each do |line|
      possibleEndingLines << line if line.hasStation(srcStation)
    end
  end
end

class TrainLine
  attr_accessor :stationList #List of stations in order. Double linked list can be used to store reverse dir too

  def initialize()
    @stationList = DoublyLinkedList.new
  end
 
  def hasStation(stationName)
    stationList.find(stationName) != nil
  end

  def hasConnection(srcStationName, destStationName)
    srcStation = @stationList.find(Station.find(srcStationName))
    return false unless srcStation

    ptr = srcStation
    while (ptr)
      return true if ptr.name == dstStationName
      ptr = ptr.next
    end
    return false
  end

  def addStation(prevStationName, stationName)
    station = Station.new(stationName)
    if (prevStation == nil)
      @stationList.add(station)
      return true
    end
    prevStationNode = @stationList.find(Station.find(prevStationName))
    if prevStationNode
      tmp = prevStationNode.next
      prevStationNode.next = station
      station.prev = prevStationNode
      station.next = tmp
      tmp.prev = station
    else
      false
    end
    true
  end
 
  def removeStation

  end
end

#Load subway train lines with list of stations in it
class TrainLineLoader

  def self.load_from_file(file)
    
  end
end

class Station
  attr_accessor :latitude, :longitude, :name #Represents points in map

  def initialize(lat, long, name)

  end
end
