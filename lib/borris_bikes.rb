require_relative 'Bikes'
class DockingStation
  attr_reader :bike
  def initialize(bike)
  end
  def release_bike
    Bike.new
  end
  def dock_bike
  end
end
