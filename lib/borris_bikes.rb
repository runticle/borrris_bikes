require_relative 'Bikes'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :station
  attr_reader :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
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
    if full?
     raise "Station full"
    else
      @station.push(bike)
     "Bike docked"
    end
  end

  private

  def full?
    @station.count >= DEFAULT_CAPACITY
  end

  def empty?
    @station.empty?
  end
end
