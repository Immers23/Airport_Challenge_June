describe 'User stories' do

  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport

  it "so planes land at airports instruct a plane to land" do
    airport = Airport.new
    plane = Plane.new
    expect{ airport.land(plane) }.not_to raise_error
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  it "so planes can take off from airports instruct a plane to take off" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).to eq []
  end
end
