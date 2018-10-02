require 'borris_bikes'
RSpec.describe DockingStation do
  it 'bike returns true for release_bike method' do
    bike = DockingStation
    expect(bike.release_bike).to eq true
  end
end
