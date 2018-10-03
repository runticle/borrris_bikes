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
    @bike = bike
    @station.push(@bike)
  end
  # def bike_available?
  #
  # end
end
