require 'plane'

describe Plane do

  let(:plane){ described_class.new }

  it { is_expected.to respond_to :flying }

  it "has a flying status when created" do
    expect(plane.flying).to eq(true)
  end

  describe 'plane landing' do

    it "can land" do
      is_expected.to respond_to(:land)
    end

    it "is not flying after landing" do
      plane.land
      expect(plane.flying).to eq(false)
    end

    it "has landed" do
      plane.land
      expect(plane).to be_landed
    end

  end

  describe 'plane taking off' do

    it "can take off" do
      is_expected.to respond_to(:take_off)
    end

    it "is flying after take off" do
      subject.landed?
      expect(subject.flying).to eq(true)
    end

  end

end
