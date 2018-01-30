class Station

  attr_accessor :trains

  def initialize(station_name)
    @station_name = station_name
    @trains = []
  end

  def add_train(train)
    self.trains << train
  end

  def trains_list
    trains
  end

  def trains_list_by_type(type)
    trains.count { |train| train.type == type }
  end

  def delete_train(train)
    trains.delete(train)
  end

end
