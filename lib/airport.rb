require_relative 'plane'

class Airport

attr_reader :planes
attr_accessor :capacity

DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full" if @planes.count >= @capacity
    planes.push(plane)
  end

  def take_off(plane)
    fail "Plane does not exist" unless @planes.include?(plane)
    planes.pop
  end

end
