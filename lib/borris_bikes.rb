require_relative 'Bikes'

class DockingStation
  attr_reader :bike
  def initialize()
    @station = []
  end
  def release_bike
    if @station.empty?
      raise "Oops, there are no bikes here"
    else
      @bike
    end
  end
  def dock(bike)
    if @station.empty?
      raise "Station full"
    end
    @bike = bike
    @station.push(@bike)
  end

end
