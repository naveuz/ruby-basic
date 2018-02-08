class TextInterface
  MENU_OPTIONS = {
    '1' => :create_station,
    '2' => :create_train,
    '3' => :create_route,
    '4' => :change_stations,
    '5' => :add_route_to_train,
    '6' => :add_carriage_to_train,
    '7' => :del_carriage_from_train,
    '8' => :move_train,
    '9' => :stations_list,
    '10' => :trains_on_station,
    '11' => :carriages_train,
    '12' => :occupy_place_or_volume,
    '0' => :abort
  }.freeze

  attr_reader :routes

  def initialize
    @routes = []
  end

  def main
    help
    loop do
      puts 'Выберите действие:'
      action = gets.chomp
      send MENU_OPTIONS[action] unless MENU_OPTIONS[action].nil?
    end
  end

  private

  def create_station
    puts 'Введите название станции:'
    name = gets.chomp
    Station.new(name)
  end

  def create_train
    begin
      puts "Выберите тип поезда:\n 1: Пассажирский\n 2: Грузовой"
      type = gets.chomp
      raise 'Тип поезда не должен быть пустым!' if type.strip.empty?
      puts 'Введите номер поезда:'
      number = gets.chomp
      puts 'Укажите производителя:'
      manufacturer = gets.chomp
      PassengerTrain.new(number, manufacturer) if type == '1'
      CargoTrain.new(number, manufacturer) if type == '2'
    rescue RuntimeError => e
      puts e.message
      retry
    end
    puts "Поезд с номером #{number} создан."
  end

  def create_route
    stations_list
    puts 'Укажите номер начальной станции:'
    start = stations[gets.to_i - 1]
    puts 'Укажите номер конечной станции:'
    finish = stations[gets.to_i - 1]
    routes << Route.new(start, finish)
  end

  def change_stations
    route = select_route
    stations_list
    puts 'Укажите номер станции:'
    station = stations[gets.to_i - 1]
    puts "Выберите действие:\n 1: Добавить\n 2: Удалить"
    action = gets.chomp
    route.add_station(station) if action == '1'
    route.delete_station(station) if action == '2'
  end

  def add_route_to_train
    route = select_route
    train = select_train
    train.add_route(route)
  end

  def add_carriage_to_train
    train = select_train
    puts 'Укажите производителя:'
    manufacturer = gets.chomp
    if train.is_a? PassengerTrain
      puts 'Введите кол-во мест:'
      places = gets.to_i
      train.add_carriage(PassengerCarriage.new(manufacturer, places))
    elsif train.is_a? CargoTrain
      puts 'Введите объем вагона:'
      volume = gets.to_i
      train.add_carriage(CargoCarriage.new(manufacturer, volume))
    end
  end

  def del_carriage_from_train
    train = select_train
    train.delete_carriage
  end

  def move_train
    train = select_train
    puts "Выберите действие:\n 1: Вперед\n 2: Назад"
    action = gets.chomp
    train.forward if action == '1'
    train.backward if action == '2'
  end

  def trains_on_station
    stations_list
    puts 'Укажите номер станции:'
    station = stations[gets.to_i - 1]
    station.each_train do |train|
      puts "#{train.number} | #{train.type} | #{train.carriages.count}"
    end
  end

  def carriages_train
    train = select_train
    if train.is_a? PassengerTrain
      train.each_carriage do |carriage, index|
        print "#{index} | Свободно мест: #{carriage.free_capacity}",
              "| Занято мест: #{carriage.occupied}\n"
      end
    elsif train.is_a? CargoTrain
      train.each_carriage do |carriage, index|
        print "#{index} | Свободный объем: #{carriage.free_capacity} м3",
              "| Занятый объем: #{carriage.occupied} м3\n"
      end
    end
  end

  def occupy_place_or_volume
    train = select_train
    carriages_list(train)
    puts 'Выберите номер вагона:'
    carriage = train.carriages[gets.to_i - 1]
    if carriage.is_a? PassengerCarriage
      carriage.occupied_capacity
    elsif carriage.is_a? CargoCarriage
      puts 'Введите занимаемый объем:'
      volume = gets.to_i
      carriage.occupied_capacity(volume)
    end
  end

  def stations_list
    stations.each.with_index(1) do |station, index|
      puts "#{index} - #{station.name}"
    end
  end

  def trains_list
    trains.each_value { |train| puts train.number }
  end

  def routes_list
    routes.each.with_index(1) do |route, index|
      puts "#{index} - #{route.name}"
    end
  end

  def carriages_list(train)
    train.carriages.each.with_index(1) do |carriage, index|
      puts "#{index} - Свободно: #{carriage.free_capacity}"
    end
  end

  def select_train
    trains_list
    puts 'Укажите номер поезда:'
    Train.find(gets.chomp)
  end

  def select_route
    routes_list
    puts 'Укажите номер маршрута:'
    routes[gets.to_i - 1]
  end

  def stations
    Station.all
  end

  def trains
    Train.all
  end

  def help
    puts [
      'Добро пожаловать!',
      '-----------------',
      '1: Создание станции',
      '2: Создание поезда',
      '3: Создание маршрута',
      '4: Управление станциями в маршруте',
      '5: Назначение маршрута поезду',
      '6: Добавление вагона',
      '7: Удаление вагона',
      '8: Перемещение поезда по маршруту',
      '9: Список станций',
      '10: Список поездов на станции',
      '11: Список вагонов поезда',
      '12: Занять место/объем в вагоне',
      '0: Завершение работы',
      '-----------------'
    ]
  end
end
