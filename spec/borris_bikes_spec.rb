require 'borris_bikes'
  describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it 'releases a bike and expects it to work' do
     station = DockingStation.new
     bike = station.release_bike
     expect(bike.working?).to eq true
   end
     it { is_expected.to respond_to(:dock).with(1).argument }
     it { is_expected.to respond_to(:bike) }
     it 'returns bike' do
       bike = Bike.new
       subject.dock(bike)
       expect(bike).to eq bike
     end
end
