require 'place_command'

describe PlaceCommand do
  let(:robot) { Robot.new }

  context 'when Robot not placed' do
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
