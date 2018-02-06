class CargoTrain < Train

  def is_right_type?(carriage)
    carriage.is_a? CargoCarriage
  end

end
