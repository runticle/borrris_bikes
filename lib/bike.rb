class Bike

  def initialize(working=true)
    @working = working
  end

  def working?
    @working
  end

  def report_broken_bike
    @working = false
  end
end
