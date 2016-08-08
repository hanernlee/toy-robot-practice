require 'position'

describe Position do

  context 'when Robot is placed' do
    let(:position) {Position.new(1,1,'SOUTH')}

    it 'returns the correct coordinates' do
      expect(position.x_coordinate).to eq 1
      expect(position.y_coordinate).to eq 1
      expect(position.direction).to eq 'SOUTH'
    end

    it 'returns coordinates in string format' do
      expect(position.pretty_string).to eq '1,1,SOUTH'
    end
  end
end
