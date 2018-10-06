require "garage"

describe Garage do
  let(:garage) { Garage.new }


  it "can store bikes" do
    bike = double(:bike)
    garage.bikes << bike
    expect(garage.bikes).to include(bike)
  end


  it "has a capacity" do
    expect(garage.capacity).not_to be_zero
  end


end
