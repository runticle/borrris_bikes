require 'borris_bikes'
require 'Bikes.rb'
  describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases a bike if one is avaiable' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
     end
     it 'raises error if no bikes are available' do
       expect { subject.release_bike }.to raise_error "Oops, there are no bikes here"
     end
     it "it doesn't release a broken bike" do
       good_bike = Bike.new
       bad_bike = Bike.new
       bad_bike.report_broken_bike
       subject.dock(bad_bike)
       subject.dock(good_bike)
       test_bike = subject.release_bike
       expect(test_bike.working?).to eq true
     end
 end

   it { is_expected.to respond_to(:dock).with(1).argument }
   it { is_expected.to respond_to(:station) }


  describe '#dock' do
    it 'docks bike if station is not full' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq "Bike docked"
    end
    it 'raises an error if there is more than one bike docked' do
      20.times {subject.dock Bike.new}
      expect { subject.dock(Bike.new) }.to raise_error "Station full"
    end
    it 'docks a broken bike' do
      bike = Bike.new
      bike.report_broken_bike
      subject.dock(bike)
      expect(subject.station.length).to eq 1
    end
  end

  describe '#initialize' do
    it 'sets the capacity to 10' do
      aldgate = DockingStation.new(10)
      expect(aldgate.capacity).to eq 10
    end
  end

end

describe Bike do
  describe '#report_broken_bike' do
    it 'tells us that bike is broken' do
      bike = Bike.new
      bike.report_broken_bike
      expect(bike.working?).to eq false
    end
  end
end
