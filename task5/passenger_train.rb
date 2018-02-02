class PassengerTrain < Train

  def is_right_type?(carriage)
    carriage.is_a? PassengerCarriage
  end

end
