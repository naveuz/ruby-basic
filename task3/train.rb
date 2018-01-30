class Train
  attr_accessor :wagons_count, :speed, :route
  attr_reader :type

  def initialize(train_number, type, wagons_count)
    @train_number = train_number
    @type = type
    @wagons_count = wagons_count
    @speed = 0
  end

  def move(speed)
    self.speed = speed
  end

  def stop
    self.speed = 0
  end

  def add_wagon
    self.wagons_count = wagons_count + 1 if speed.zero?
  end

  def delete_wagon
    self.wagons_count = wagons_count - 1 if speed.zero?
  end

  def set_route(route)
    self.route = route
    @route_index = 0
    current_station.add_train(self)
  end

  def forward
    current_station.delete_train(self)
    @route_index += 1
    current_station.add_train(self)
  end

  def backward
    current_station.delete_train(self)
    @route_index -= 1
    current_station.add_train(self)
  end

  def current_station
    route.stations[@route_index]
  end

  def prev_station
    route.stations[@route_index - 1]
  end

  def next_station
    route.stations[@route_index + 1]
  end
end
