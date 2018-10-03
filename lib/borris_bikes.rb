require_relative 'Bikes'

class DockingStation
  def initialize()
    @station = []
  end
  def release_bike
    bike = Bike.new
  end
  def dock(bike)
    @bike = bike
    @station.push(@bike)
  end
  attr_reader :bike

end
