require_relative 'place_command'
require_relative 'move_command'
require_relative 'rotate_command'
require_relative 'report_command'

class Commander
  def initialize(robot)
    @robot = robot
  end

  def execute(input)
    if input.start_with?("PLACE")
      PlaceCommand.new(input,@robot).execute
    elsif input.start_with?("MOVE")
      MoveCommand.new(@robot).execute
    elsif input.start_with?("LEFT","RIGHT")
      RotateCommand.new(input,@robot).execute
    elsif input.start_with?("MOVE")
      MoveCommand.new(@robot).execute
    elsif input.start_with?("REPORT")
      ReportCommand.new(@robot).execute
    else
      command_error
    end
  end

  private

    def command_error
      puts "Sorry unacceptable command. Please enter a correct command (eg. 'PLACE X,Y,F', 'MOVE', 'REPORT', 'LEFT', 'RIGHT')."
    end
end
