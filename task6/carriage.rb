class Carriage
  include Manufacturer
  include Validation

  def initialize(manufacturer)
    @manufacturer = manufacturer
    validate!
  end

  protected

  def validate!
    raise 'Производитель не может быть пустым!' if manufacturer.strip.empty?
    true
  end
end
