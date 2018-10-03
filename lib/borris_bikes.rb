require_relative 'Bikes'

class DockingStation
  def initiliaze()
    @station = []
  end
  def release_bike
    bike = Bike.new
  end
  def dock(bike)
    @station.push(bike)
  end
  def bike

  end
end
