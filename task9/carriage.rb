class Carriage
  include Manufacturer
  include Validation

  attr_reader :capacity, :occupied

  validate :manufacturer, :presence

  def initialize(manufacturer, capacity)
    @manufacturer = manufacturer
    @capacity = capacity
    validate!
    @occupied = 0
  end

  def free_capacity
    capacity - occupied
  end
end
