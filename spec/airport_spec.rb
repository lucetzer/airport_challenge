require 'airport'

describe Airport do

  let(:airport) { described_class.new }
  let(:plane) { double :plane, flying?: true, land: false, take_off: true }

  describe "take off" do

    it { is_expected.to respond_to(:release_plane) }

    it "raises error when there are no planes available" do
      expect(airport.release_plane(plane)).to eq false
    end

    it "releases a plane" do
      allow(airport.weather).to receive(:stormy?) { false }
      airport.dock(plane)
      airport.release_plane(plane)
      expect(airport.planes.empty?).to eq true
    end

  end

  describe "landing" do

    it "instructs a plane to land" do
      is_expected.to respond_to(:dock).with(1).argument
    end

    it "receives a plane" do
      allow(airport.weather).to receive(:stormy?) { false }
      airport.dock(plane)
      expect(airport.planes.any?).to eq true
    end

  end

  describe "traffic control" do

    context 'when airport is full' do

      it "has a default capacity" do
        expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
      end

      it "raises an error when airport is full" do
        allow(airport.weather).to receive(:stormy?) { false }
        airport.capacity.times { airport.dock plane }
        message = "Unavailable because airport is full"
        expect { airport.dock plane }.to raise_error message
      end

    end

    context "when weather conditions are stormy" do

      before(:each) do
        allow(airport.weather).to receive(:stormy?) { true }
      end

      it "tests the stormy method" do
        srand(40)
        expect(airport.weather.stormy?).to eq true
      end

      it "does not allow a plane to take off" do
        expect(airport.release_plane(plane)).to eq false
      end

      it "does not allow a plane to land" do
        message = "Unable to land due to stormy weather"
        expect{ airport.dock plane }.to raise_error message
      end

    end

  end

end
