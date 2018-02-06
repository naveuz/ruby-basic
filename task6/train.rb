class Train
  include Manufacturer
  include Validation

  attr_accessor :speed, :route
  attr_reader :number, :carriages

  NUMBER_FORMAT = /^[а-я0-9]{3}-?[а-я0-9]{2}$/i

  @@trains = {}

  class << self
    def all
      @@trains
    end

    def find(number)
      @@trains[number]
    end
  end

  def initialize(number, manufacturer)
    @number = number
    @manufacturer = manufacturer
    validate!
    @carriages = []
    @speed = 0
    @@trains[@number] = self
  end

  def move(speed)
    self.speed = speed
  end

  def stop
    self.speed = 0
  end

  def add_carriage(carriage)
    carriages << carriage if speed.zero? && is_right_type?(carriage)
  end

  def delete_carriage
    carriages.delete_at(-1) if speed.zero?
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

  protected

  def validate!
    raise 'Номер не может быть пустым!' if number.strip.empty?
    raise 'Номер не соответствует требуемому формату!' if number !~ NUMBER_FORMAT
    raise 'Производитель не может быть пустым!' if manufacturer.strip.empty?
    true
  end
end
