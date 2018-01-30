class CargoTrain < Train

  def initialize(number)
    super(number)
    @type = :cargo
  end

  def add_carriage(carriage)
    carriages << carriage if speed.zero? && carriage.class == CargoCarriage
  end

end
