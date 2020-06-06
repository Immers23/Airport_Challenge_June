require 'airport'
require 'weather'
require 'plane'

describe 'User stories' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  it "so planes land at airports instruct a plane to land" do
    expect{ airport.land(plane) }.not_to raise_error
  end
  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it "so planes can take off from airports instruct a plane to take off" do
    allow(Weather).to receive(:stormy?) { false }
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).to eq []
  end
  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full
  it "prevents landing of a plane when the airport is full" do
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    expect{ airport.land(plane) }.to raise_error 'Airport is full'
  end
  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate
  it 'allows for the default capacity to be changed' do
    airport.capacity=5
    expect(airport.capacity).to eq 5
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy
  it 'prevents takeoff when the weather is story' do
    allow(Weather).to receive(:stormy?) { true }
    airport.land(plane)
    expect{ airport.take_off(plane) }.to raise_error 'Cannot take off when stormy'
  end

end
