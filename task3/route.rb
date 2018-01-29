class Route

  attr_accessor :stations
  attr_reader :station_start, :station_end

  def initialize(station_start, station_end)
    @station_start = station_start
    @station_end = station_end
    @stations = []
  end

  def add_station(station)
    self.stations << station
  end

  def delete_station(station)
    stations.delete(station)
  end

  def get_stations
    [station_start] << stations << [station_end]
  end

end
