class Carriage
  include Manufacturer

  def initialize(manufacturer)
    @manufacturer = manufacturer
  end
end
