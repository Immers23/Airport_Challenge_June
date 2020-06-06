require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  it 'will be on the ground when created' do
    expect(subject.in_air).to eq false
  end

  it 'will be marked as in the air when cleared for take off' do
    subject.clear_for_take_off
    expect(subject.in_air).to eq true
  end


end
