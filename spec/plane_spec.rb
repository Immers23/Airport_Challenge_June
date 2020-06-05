require 'plane'
require 'airport'

describe Plane do

  let(:airport) { Airport.new }
  let(:airport2) { Airport.new }
  let(:plane) { Plane.new }
  let(:plane2) { Plane.new }

  it 'will only take off from an airport that a plane is in' do
    airport.capacity=2
    airport.land(plane)
    airport.land(plane2)
    expect { airport2.take_off(plane2) }.to raise_error "Plane does not exist"
  end
end
