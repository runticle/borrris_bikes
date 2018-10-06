require 'dockingstation'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  let(:bike) { double(:bike, working?: true) }

  describe '#release_bike' do
    it 'releases a bike if one is avaiable' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
     end
     it 'raises error if no bikes are available' do
       expect { subject.release_bike }.to raise_error "Oops, there are no bikes here"
     end
     it "it doesn't release a broken bike" do
       good_bike = double(:bike, working?: true)
       bad_bike = double(:bike, working?: false)
       subject.dock(bad_bike)
       subject.dock(good_bike)
       test_bike = subject.release_bike
       expect(test_bike.working?).to eq true
     end
 end

   it { is_expected.to respond_to(:dock).with(1).argument }
   it { is_expected.to respond_to(:bikes) }


  describe '#dock' do
    it 'docks bike if station is not full' do
      expect(subject.dock(bike)).to eq "Bike docked"
    end
    it 'raises an error if there is more than one bike docked' do
      20.times {subject.dock double(:bike)}
      expect { subject.dock(bike) }.to raise_error "Station full"
    end
    it 'docks a broken bike' do
      allow(bike).to receive(:working?).and_return(false)
      subject.dock(bike)
      expect(subject.bikes.length).to eq 1
    end
  end

  describe '#initialize' do
    it 'sets the capacity to 10' do
      aldgate = DockingStation.new(10)
      expect(aldgate.capacity).to eq 10
    end
  end

end
