require "bike"

describe Bike do
  describe '#report_broken_bike' do
    it 'tells us that bike is broken' do
      bike = Bike.new
      bike.report_broken_bike
      expect(bike.working?).to eq false
    end
  end
end
