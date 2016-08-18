describe RotateCommand do
  let(:robot) { Robot.new }

  context 'when Robot is not placed' do
    it 'does not register RotateCommand' do
      rotate = RotateCommand.new('LEFT',robot)
      expect(rotate.execute).to eq(false)
    end
  end

  context 'when Robot is placed' do
    before do
      PlaceCommand.new('PLACE 0,0,NORTH',robot).execute
    end

    it 'rotates LEFT' do
      RotateCommand.new('LEFT',robot).execute
      expect(robot.current_position.direction).to eq('WEST')
    end

    it'rotates RIGHT' do
      RotateCommand.new('RIGHT',robot).execute
      expect(robot.current_position.direction).to eq('EAST')
    end
  end
end
