class Route
  attr_reader :start_station, :final_station, :way_stations


  def initialize(start_station, final_station, way_stations)
    @start_station = start_station
    @final_station = final_station
    @way_stations = way_stations
  end

  def add_way_station(station, index=-1) 
    raise ArgumentError, "Station must be a Station object" unless station.is_a?(Station)
    raise ArgumentError, "Index must be a positive integer" unless index.is_a?(Integer) && index >= 0
    @way_stations.insert(index, station)
  end

  def remove_way_station(index: nil, name: nil)
    raise ArgumentError, "Index must be a positive integer" unless index.nil? || index.is_a?(Integer) && index >= 0
    raise ArgumentError, "Name must be a string" unless name.nil? || name.is_a?(String)
    @way_stations.delete_at(index) unless index.nil?
    @way_stations.delete_if { |station| station.name == name } unless name.nil?
  end

  def get_stations
    return [@start_station, *@way_stations, @final_station]
  end

  def print_stations
    p get_stations
  end
end