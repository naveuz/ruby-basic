class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
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
