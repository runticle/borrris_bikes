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
    @station.each do |bike|
      if bike.working?
        return bike
        break
      end
    end
  end

  def dock(bike, working = true)
    raise "Station full" if full?
    bike.report_broken_bike if working == false
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
