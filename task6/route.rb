class Route
  include Validation

  attr_reader :name, :stations, :station_start, :station_end

  def initialize(station_start, station_end)
    @station_start = station_start
    @station_end = station_end
    validate!
    @name = "#{station_start.name} - #{station_end.name}"
    @stations = [station_start, station_end]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  protected

  def validate!
    raise 'Начальная станция не может быть пустой!' if station_start.nil?
    raise 'Конечная станция не может быть пустой!' if station_end.nil?
    true
  end
end
