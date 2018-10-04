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
    raise "Oops, there are no bikes here" if empty?
    @station[0]
  end

  def dock(bike)
    raise "Station full" if full?
    @station.push(bike)
    "Bike docked"
  end

  private

  def full?
    @station.count >= DEFAULT_CAPACITY
  end

  def empty?
    @station.empty?
  end
end
