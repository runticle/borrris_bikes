class Van
  def initialize
    @bikes = []
  end

  def collect_from(location, working)
    raise "#{location.class} does not have the bikes you're looking for" if location.bikes.select {|bike| bike.working? == working}.empty?
    chosen_bike = location.bikes.find { |bike| bike.working? == working }
    @bikes << chosen_bike
    location.bikes.delete(chosen_bike)
  end

  def deliver_to(location, working)
    raise "#{location.class} full" if location.full?
    raise "Van does not have the bikes you're looking for" if @bikes.select {|bike| bike.working? == working}.empty?
    chosen_bike = @bikes.find { |bike| bike.working? == working }
    location.bikes << chosen_bike
    @bikes.delete(chosen_bike)
  end

  attr_accessor :bikes
end
