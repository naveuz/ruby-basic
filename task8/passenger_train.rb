class PassengerTrain < Train
  def type
    'пассажирский'
  end

  def right_type?(carriage)
    carriage.is_a? PassengerCarriage
  end
end
