require 'move_command'

describe MoveCommand do
  let(:robot) { Robot.new }
  let(:move) {MoveCommand.new(robot)}

  context 'when Robot is not placed' do
    it 'does not register MoveCommand' do
      expect(move.execute).to eq(false)
    end
  end

  context 'when Robot is placed' do
    it 'does not allow invalid movement' do
      PlaceCommand.new('PLACE 0,0,SOUTH',robot).execute
      expect(move.execute).to eq(false)
    end

    it 'allows valid NORTH movement' do
      PlaceCommand.new('PLACE 0,0,NORTH',robot).execute
      move.execute
      expect(robot.report).to eq('0,1,NORTH')
    end

    it 'allows valid SOUTH movement' do
      PlaceCommand.new('PLACE 0,1,SOUTH',robot).execute
      move.execute
      expect(robot.report).to eq('0,0,SOUTH')
    end

    it 'allows valid EAST movement' do
      PlaceCommand.new('PLACE 0,0,EAST',robot).execute
      move.execute
      expect(robot.report).to eq('1,0,EAST')
    end

    it 'allows valid WEST movement' do
      PlaceCommand.new('PLACE 1,0,WEST',robot).execute
      move.execute
      expect(robot.report).to eq('0,0,WEST')
    end
  end
end
