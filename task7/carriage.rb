class Carriage
  include Manufacturer
  include Validation

  attr_reader :capacity, :occupied

  def initialize(manufacturer, capacity)
    @manufacturer = manufacturer
    @capacity = capacity
    validate!
    @occupied = 0
  end

  def free_capacity
    capacity - occupied
  end

  protected

  def validate!
    raise 'Производитель не может быть пустым!' if manufacturer.strip.empty?
    true
  end
end
