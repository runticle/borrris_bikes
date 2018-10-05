class Van
  def initialize
    @bikes = []
  end

  def collect_from(location, working)
    chosen_bike = location.bikes.find { |bike| bike.working? == working }
    @bikes << chosen_bike
    location.bikes.delete(chosen_bike)
  end

  def deliver_to(location, working)
    chosen_bike = @bikes.find { |bike| bike.working? == working }
    location.bikes << chosen_bike
    @bikes.delete(chosen_bike)
  end

  attr_accessor :bikes
end
