require 'report_command'

describe ReportCommand do
  let(:robot) { Robot.new }
  let(:report) {ReportCommand.new(robot)}

  context 'when Robot is placed' do
    before do
      PlaceCommand.new('PLACE 5,5,WEST',robot).execute
    end

    it 'correctly reports coordinates of Robot' do
      expect(report.execute).to eq('5,5,WEST')
    end
  end
end
