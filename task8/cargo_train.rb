class CargoTrain < Train
  def type
    'грузовой'
  end

  def right_type?(carriage)
    carriage.is_a? CargoCarriage
  end
end
