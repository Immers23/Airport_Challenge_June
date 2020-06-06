require 'airport'
require 'plane'

describe Airport do

  subject(:airport) { described_class.new }
  let(:airport2) { Airport.new }
  let(:plane) { Plane.new }
  let(:plane2) { Plane.new }

  before(:each) do
    airport.land(plane)
  end

  it 'will only take off from an airport that a plane is in' do
    airport.capacity=2
    airport.land(plane2)
    expect { airport2.take_off(plane2) }.to raise_error "Plane does not exist in airport"
  end

  it 'planes that are already flying cannot take off' do
    airport.take_off(plane)
    airport.land(plane2)
    expect { airport.take_off(plane) }.to raise_error "Plane does not exist in airport"
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
      expect { airport.land(plane2) }.to raise_error "Airport is full"
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it 'removes the plane from the plane array' do
      airport.take_off(plane)
      expect(airport.planes).to eq []
    end
  end

end
