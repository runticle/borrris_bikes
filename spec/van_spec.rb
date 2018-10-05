require 'van'

describe Van do
  let(:van) { Van.new }

  let(:working_bike) { double(:working_bike, working?: true) }
  let(:broken_bike) { double(:broken_bike, working?: false) }
  let(:station) { double(:station) }
  let(:garage) { double(:garage) }



  describe "#collect_from" do

    it "collects a broken bike from a station" do
      allow(station).to receive(:bikes).and_return([working_bike, broken_bike])
      van.collect_from(station, false)
      expect(van.bikes).to include(broken_bike)
      expect(station.bikes).to eq [working_bike]
    end

    it "collects a working bike from a garage" do
      allow(garage).to receive(:bikes).and_return([broken_bike, working_bike])
      van.collect_from(garage, true)
      expect(van.bikes).to include(working_bike)
      expect(garage.bikes).to eq [broken_bike]
    end
  end

  describe "#deliver_to" do

    before { van.bikes = [working_bike, broken_bike] }

    it "delivers a broken bike to a garage" do
      allow(garage).to receive(:bikes).and_return([])
      van.deliver_to(garage, false)
      expect(garage.bikes).to eq [broken_bike]
      expect(van.bikes).to eq [working_bike]
    end

    it "delivers a working bike to a station" do
      allow(station).to receive(:bikes).and_return([])
      van.deliver_to(station, true)
      expect(station.bikes).to eq [working_bike]
      expect(van.bikes).to eq [broken_bike]
    end

  end


end
