require 'airport'
require 'plane'

describe Airport do

  subject(:airport) { described_class.new }
  subject(:plane) { described_class.new }
  subject(:plane2) { described_class.new }

  before(:each) do
    airport.land(plane)
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
