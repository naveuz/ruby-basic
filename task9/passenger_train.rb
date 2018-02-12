class PassengerTrain < Train
  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT
  validate :manufacturer, :presence

  def type
    'пассажирский'
  end

  def right_type?(carriage)
    carriage.is_a? PassengerCarriage
  end
end
