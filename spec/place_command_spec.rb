require 'place_command'

describe PlaceCommand do
  let(:robot) { Robot.new }

  context 'invalid format' do
    it 'does not register place command' do
      place = PlaceCommand.new('PLACEEEE 2,2,EAST',robot).execute
      expect(place).to eq(false)
    end
  end

  context 'out of bounds placement' do
    it 'does not register place command' do
      place = PlaceCommand.new('PLACE 9,9,NORTH',robot).execute
      expect(place).to eq(false)
    end
  end

  context 'when Robot is not placed' do
    it 'places Robot on table' do
      PlaceCommand.new('PLACE 0,0,NORTH',robot).execute
      expect(robot.report).to eq('0,0,NORTH')
    end
  end

  context 'when Robot is placed' do
    it 'places Robot at a new position' do
      PlaceCommand.new('PLACE 2,2,SOUTH',robot).execute
      expect(robot.report).to eq('2,2,SOUTH')
    end
  end
end
