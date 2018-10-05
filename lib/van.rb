class Van
  def initialize
    @bikes = []
  end

  def collect_from(location, working)
    broken_bike = location.bikes.find { |bike| bike.working? == working }
    @bikes << broken_bike
    location.bikes.delete(broken_bike)
  end

  attr_reader :bikes
end
