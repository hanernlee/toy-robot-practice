class ReportCommand
  def initialize(robot)
    @robot = robot
  end

  def execute
    @robot.report
  end
end
