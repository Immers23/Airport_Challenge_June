require 'plane'
require 'airport'
require 'weather'

describe Weather do

  subject(:weather) { described_class.new }
  let(:plane) { double(in_air: false) }
  let(:airport) { Airport.new }

  it 'prevents takeoff when the weather is story' do
    airport.land(plane)
    weather.forecast == 'stormy'
    allow(plane).to receive(:clear_for_take_off).and_return(:true)
    expect{ airport.take_off(plane) }.to raise_error 'Cannot take off when stormy'
  end

end
