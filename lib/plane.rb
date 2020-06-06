class Plane

  attr_accessor :in_air

  def initialize
    @in_air = false
  end

  def clear_for_take_off
    @in_air = true
  end

end
