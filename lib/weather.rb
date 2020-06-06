require_relative 'airport'
require_relative 'plane'

module Weather

  def self.stormy?
    rand(1..2) == 1
  end

end
