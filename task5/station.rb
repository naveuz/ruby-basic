class Station
  attr_reader :name, :trains

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
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
end
