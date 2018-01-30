class Route

  attr_reader :stations

  def initialize(station_start, station_end)
    @stations = [station_start, station_end]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  def get_stations
    stations
  end

end
