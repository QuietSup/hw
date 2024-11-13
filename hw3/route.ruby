# class Route
#   attr_reader :start_station, :final_station, :way_stations


#   def initialize(start_station, final_station, way_stations)
#     @start_station = start_station
#     @final_station = final_station
#     @way_stations = way_stations
#   end

#   def add_way_station(station, index=-1) 
#     raise ArgumentError, "Station must be a Station object" unless station.is_a?(Station)
#     raise ArgumentError, "Index must be a positive integer" unless index.is_a?(Integer) && index >= 0
#     @way_stations.insert(index, station)
#   end

#   def remove_way_station(index: nil, name: nil)
#     raise ArgumentError, "Index must be a positive integer" unless index.nil? || index.is_a?(Integer) && index >= 0
#     raise ArgumentError, "Name must be a string" unless name.nil? || name.is_a?(String)
#     @way_stations.delete_at(index) unless index.nil?
#     @way_stations.delete_if { |station| station.name == name } unless name.nil?
#   end

#   def get_stations
#     return [@start_station, *@way_stations, @final_station]
#   end

#   def print_stations
#     p get_stations
#   end
# end

class Route 
  attr_reader :stations

  def initialize(start_station, final_station)
    @stations = [start_station, final_station]
  end

  # Adds a way station to the route.
  #
  # @param station [Station] The station to be added. Must be an instance of the Station class.
  # @param number [Integer, nil] The way station order number.
  #   - If nil or >= number of stations, the station is added just before the final station.
  #   - If >1 within the range, the station is added at that specific index.
  #
  # @raise [ArgumentError] If the station is not an instance of the Station class.
  # @raise [ArgumentError] If the number is not a positive integer or nil.
  #
  # @return [Array<Station>] The updated list of stations.
  def add_way_station(station, number = nil)
    raise ArgumentError, "Station must be a Station object" unless station.is_a?(Station)
    raise ArgumentError, "Number must be an integer >1 or nil" unless number.nil? || number.is_a?(Integer) && number >= 1
    
    if number == nil or number >= @stations.length
      @stations.insert(-1, station)
    else
      @stations.insert(number, station)
    end

    return @stations
  end

  def remove_way_station(name = nil, number = nil)
    raise ArgumentError, "Number must be an integer >1 or nil" unless number.nil? || number.is_a?(Integer) && number >= 1
    raise ArgumentError, "Name must be a string" unless name.nil? || name.is_a?(String)
    
    @stations.delete_at(-2) if number >= @stations.length - 1
    @stations.delete_at(number) unless number.nil?
    @stations.delete_if { |station| name == station.name && name != start_station.name && name != final_station.name } unless name.nil?
  end

  def way_stations
    @stations.slice(1..-2)
  end

  def start_station
    @stations[0]
  end

  def final_station
    @stations[-1]
  end

  def print_stations
    p @stations
  end
  
end