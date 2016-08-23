require 'constraint'

describe Constraint do
  context 'when Robot not placed' do
    let(:robot) {Robot.new}

    it 'allows valid placement' do
      PlaceCommand.new('0,0,NORTH',robot).execute
      constraint = Constraint.new(0,0,'NORTH')
      expect(constraint.valid_place_parameters?).to eq(true)
    end

    it 'does not allow invalid placement' do
      PlaceCommand.new('8,8,NORTH',robot).execute
      constraint = Constraint.new(8,8,'NORTH')
      expect(constraint.valid_place_parameters?).to eq(false)
    end

    it 'does not allow invalid movement' do
      MoveCommand.new(robot).execute
      constraint = Constraint.new(0,0,'SOUTH')
      expect(constraint.valid_move_parameters?).to eq(false)
    end
  end

  context 'when Robot is placed' do
    let(:robot) {Robot.new}

    it 'allows valid placement' do
      PlaceCommand.new('2,2,NORTH',robot).execute
      constraint = Constraint.new(2,2,'NORTH')
      expect(constraint.valid_place_parameters?).to eq(true)
    end

    it 'allows valid movement' do
      PlaceCommand.new('0,0,NORTH',robot).execute
      constraint = Constraint.new(0,0,'NORTH')
      expect(constraint.valid_move_parameters?).to eq(true)
    end

    it 'does not allow invalid placement' do
      PlaceCommand.new('10,10,EAST',robot).execute
      constraint = Constraint.new(10,10,'EAST')
      expect(constraint.valid_place_parameters?).to eq(false)
    end

    it 'does not allow invalid movement' do
      PlaceCommand.new('0,0,SOUTH',robot).execute
      constraint = Constraint.new(0,0,'SOUTH')
      MoveCommand.new(robot).execute
      expect(constraint.valid_move_parameters?).to eq(false)
    end
  end
end
