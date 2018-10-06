require "./lib/bike"
require "./lib/dockingstation"
require "./lib/garage"
require "./lib/van"


working_bike = Bike.new
broken_bike = Bike.new(false)

station = DockingStation.new(2)
garage = Garage.new(2)

van = Van.new
