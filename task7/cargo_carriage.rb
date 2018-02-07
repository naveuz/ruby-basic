class CargoCarriage < Carriage
  def occupied_capacity(volume)
   @occupied += volume
  end
end
