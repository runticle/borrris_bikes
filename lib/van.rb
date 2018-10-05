class Van
  def initialize
    @bikes = []
  end

  def collect_from(location, working)
    raise "#{location.class} does not have the bikes you're looking for" unless has_right_bikes?(location, working)
    @bikes << chosen_bike(location, working)
    location.bikes.delete chosen_bike(location, working)
  end

  def deliver_to(location, working)
    raise "#{location.class} full" if location.full?
    raise "Van does not have the bikes you're looking for" unless has_right_bikes?(self, working)

    location.bikes << chosen_bike(self, working)
    @bikes.delete chosen_bike(self, working)
  end


  def has_right_bikes?(location, working)
    location.bikes.select {|bike| bike.working? == working}.any?
  end

  def chosen_bike(location, working)
    location.bikes.find { |bike| bike.working? == working }
  end


  attr_accessor :bikes
end
