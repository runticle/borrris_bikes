require 'van'

describe Van do
  let(:van) { Van.new }
  let(:working_bike) { double(:working_bike, working?: true) }
  let(:broken_bike) { double(:broken_bike, working?: false) }
  let(:station) { double(:station, full?: false, class: "Station", empty?: false) }
  let(:garage) { double(:garage, full?: false, class: "Garage", empty?: false) }



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

    it "raise an error when station is empty" do
      allow(station).to receive(:empty?).and_return(true)
      allow(station).to receive(:bikes).and_return([])
      expect{van.collect_from(station, false)}.to raise_error "Station empty"
    end

    it "raises an error when garage is empty" do
      allow(garage).to receive(:empty?).and_return(true)
      allow(garage).to receive(:bikes).and_return([])
      expect{van.collect_from(garage, true)}.to raise_error "Garage empty"
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

    it "raises an error when the station is full" do
      allow(station).to receive(:full?).and_return(true)
      expect{van.deliver_to(station, true)}.to raise_error "Station full"
    end

    it "raises an error when the garage is full" do
      allow(garage).to receive(:full?).and_return(true)
      expect{van.deliver_to(garage, false)}.to raise_error "Garage full"
    end

  end


end
