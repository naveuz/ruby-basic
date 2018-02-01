class TextInterface
  attr_reader :stations, :trains, :routes

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def main
    help
    loop do
      puts 'Выберите действие:'
      action = gets.chomp
      case action
      when '1' then create_station
      when '2' then create_train
      when '3' then create_route
      when '4' then change_stations
      when '5' then add_route_to_train
      when '6' then add_carriage_to_train
      when '7' then del_carriage_from_train
      when '8' then move_train
      when '9' then stations_list
      when '10' then trains_on_station
      when '0' then abort('Завершение работы.')
      end
    end
  end

  #делаем методы приватными, дабы все управление было через main
  #без возможности обращения к методам напрямую
  private

  def create_station
    puts 'Введите название станции:'
    name = gets.chomp
    stations << Station.new(name)
  end

  def create_train
    puts "Выберите тип поезда:\n 1: Пассажирский\n 2: Грузовой"
    type = gets.chomp
    puts 'Введите номер поезда:'
    number = gets.chomp
    trains << PassengerTrain.new(number) if type == '1'
    trains << CargoTrain.new(number) if type == '2'
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
    train.set_route(route)
  end

  def add_carriage_to_train
    train = select_train
    train.add_carriage(PassengerCarriage.new) if train.is_a? PassengerTrain
    train.add_carriage(CargoCarriage.new) if train.is_a? CargoTrain
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
    station.trains.each { |train| puts "#{train.number} | #{train.type} | #{train.carriages.count}" }
  end

  def stations_list
    stations.each.with_index(1) { |station, index|  puts "#{index} - #{station.name}" }
  end

  def trains_list
    trains.each.with_index(1) { |train, index|  puts "#{index} - #{train.number}" }
  end

  def routes_list
    routes.each.with_index(1) { |route, index|  puts "#{index} - #{route.name}" }
  end

  def select_train
    trains_list
    puts 'Укажите номер поезда:'
    trains[gets.to_i - 1]
  end

  def select_route
    routes_list
    puts 'Укажите номер маршрута:'
    routes[gets.to_i - 1]
  end

  def help
    puts %q(
    Добро пожаловать!
    -----------------
    1: Создание станции.
    2: Создание поезда.
    3: Создание маршрута.
    4: Управление станциями в маршруте.
    5: Назначение маршрута поезду.
    6: Добавление вагона.
    7: Удаление вагона.
    8: Перемещение поезда по маршруту.
    9: Список станций.
    10: Список поездов на станции.
    0: Завершение работы.
    -----------------
    )
  end
end
