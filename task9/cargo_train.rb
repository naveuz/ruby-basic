class CargoTrain < Train
  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT
  validate :manufacturer, :presence

  def type
    'грузовой'
  end

  def right_type?(carriage)
    carriage.is_a? CargoCarriage
  end
end
