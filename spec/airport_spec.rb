require 'airport'
require 'plane'

describe Airport do

  subject(:airport) { described_class.new }
  let(:airport2) { described_class.new }
  let(:plane) { double(in_air: false) }
  let(:plane2) { double(in_air: false) }
  let(:plane3) { double(in_air: false) }
  let(:plane4) { double(in_air: false) }

  before(:each) do
    airport.land(plane)
  end

  it 'will only take off from an airport that a plane is in' do
    airport.land(plane2)
    airport.land(plane3)
    expect { airport2.take_off(plane2) }.to raise_error "Plane does not exist in airport"
  end

  it 'planes that have taken off from an airport cannot take off again' do
    allow(plane).to receive(:in_air).and_return(:true)
    expect { airport.take_off(plane) }.to raise_error "plane is already airbourne"
  end

  describe '#capacity=' do
    it 'changes the capacity to a new value' do
      expect(airport).to respond_to(:capacity)
    end
  end

  describe '#land' do
    it 'instructs a plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'adds a plane into the planes array' do
      expect(airport.planes).to eq [plane]
    end

    it 'raises an error when airport is full' do
      airport.land(plane2)
      airport.land(plane3)
      expect { airport.land(plane4) }.to raise_error "Airport is full"
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it 'removes the plane from the plane array' do
      allow(plane).to receive(:clear_for_take_off)
      airport.take_off(plane)
      expect(airport.planes).to eq []
    end
  end

end
