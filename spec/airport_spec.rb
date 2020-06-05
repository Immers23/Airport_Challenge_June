require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  it 'instracts a plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

end