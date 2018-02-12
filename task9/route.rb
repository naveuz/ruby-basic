class Route
  attr_reader :name, :stations, :station_start, :station_end

  def initialize(station_start, station_end)
    @station_start = station_start
    @station_end = station_end
    @name = "#{station_start.name} - #{station_end.name}"
    @stations = [station_start, station_end]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end
end
