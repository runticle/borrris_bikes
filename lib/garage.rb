class Garage
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def full?
    @bikes.length >= @capacity
  end

  attr_accessor :bikes, :capacity
end
