require_relative 'plane'

class Airport

attr_reader :planes
attr_accessor :capacity

DEFAULT_CAPACITY = 3

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full" if planes.count >= capacity
    planes.push(plane)
  end

  def take_off(plane)
    fail "plane is already airbourne" if plane.in_air
    fail "Plane does not exist in airport" unless planes.include?(plane)

    plane.clear_for_take_off
    remove_plane(plane)
  end

private

  def remove_plane(plane)
    @planes.delete(plane)
  end


end
