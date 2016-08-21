require_relative 'constraint'
require_relative 'position'
require_relative 'robot'

class PlaceCommand
  def initialize(input,robot)
    format_input = input.gsub("PLACE ","")
    @x_coordinate = format_input.scan(/\d+/)[0].to_i
    @y_coordinate = format_input.scan(/\d+/)[1].to_i
    @direction = format_input.scan(/NORTH|SOUTH|EAST|WEST/)[0]
    @robot = robot
  end

  def execute
    if valid_placement?
      @robot.current_position = position
    else
      error_message
    end
  end

  private

    def valid_placement?
      constraint.valid_place_parameters?
    end

    def constraint
      constraint = Constraint.new(@x_coordinate, @y_coordinate, @direction)
    end

    def position
      position = Position.new(@x_coordinate, @y_coordinate, @direction)
    end

    def error_message
      puts "Sorry the PLACE command format is invalid or out of bounds!"
      puts "Try 'PLACE 0,0,NORTH'"
    end
end
