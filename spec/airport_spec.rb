require 'airport'
require 'plane'

describe Airport do

  subject(:airport) { described_class.new }

  describe '#land' do
    it 'instructs a plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'adds a plane into the planes array' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it 'removes the plane from the plane array' do
      plane = Plane.new
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to eq []
    end
  end



end
