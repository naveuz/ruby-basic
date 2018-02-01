class PassengerTrain < Train

  def type
    'пассажирский'
  end

  def is_right_type?(carriage)
    carriage.is_a? PassengerCarriage
  end

end
