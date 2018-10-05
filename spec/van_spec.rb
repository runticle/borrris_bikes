require 'van'

describe Van do
  let(:van) { Van.new }

  let(:bike) { double(:bike) }
  let(:station) { double(:station) }



  describe "#collect" do

    it "collects a broken bike from a station" do
      allow(bike).to receive(:working?).and_return(false)
      allow(station).to receive(:bikes).and_return([bike])
      van.collect_from(station, false)
      expect(van.bikes).to include(bike)
    end

    it "collects a working bike from a garage" do

    end
  end
end
