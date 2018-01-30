class PassengerTrain < Train

  def initialize(number)
    super(number)
    @type = :passenger
  end

  def add_carriage(carriage)
    carriages << carriage if speed.zero? && carriage.class == PassengerCarriage
  end

end
