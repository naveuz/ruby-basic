class Station
  include Validation

  attr_reader :name, :trains

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations << self
  end

  def each_train
    trains.each { |train| yield(train) }
  end

  def add_train(train)
    trains << train
  end

  def trains_list_by_type(type)
    trains.count { |train| train.type == type.to_sym }
  end

  def delete_train(train)
    trains.delete(train)
  end

  protected

  def validate!
    raise 'Название станции не может быть пустым!' if name.strip.empty?
    true
  end
end
