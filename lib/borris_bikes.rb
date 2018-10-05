require 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise "Oops, there are no bikes here" if empty?
    chosen_bike = @bikes.find { |bike| bike.working? }
    @bikes.delete(chosen_bike)
    chosen_bike
  end

  def dock(bike, working = true)
    raise "Station full" if full?
    bike.report_broken_bike if working == false
    @bikes << bike
    "Bike docked"
  end

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
