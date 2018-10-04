require_relative 'Bikes'

class DockingStation
  attr_reader :bike
  def initialize()
    @station = []
  end

  def release_bike
    if empty?
      raise "Oops, there are no bikes here"
    else
      @station[0]
    end
  end

  def dock(bike)
    @station.count
    if full?
       @station.push(bike)
      "Bike docked"
    else
       @station
      raise "Station full"
    end
  end

  private

  def full?
    @station.count <= 19
  end

  def empty?
    @station.empty?
  end
end
