class MoveCommand
  def initialize(robot)
    @robot = robot
  end

  def execute
    if @robot.placed?
      if valid_movement?
        case robot_direction
        when "NORTH" then move_north
        when "EAST" then move_east
        when "SOUTH" then move_south
        when "WEST" then move_west
        end
      else
        move_error
      end
    else
      place_error
    end
  end

  private

    def robot_position
      @robot.current_position
    end

    def robot_direction
      robot_position.direction
    end

    def move_north
      robot_position.y_coordinate += 1
    end

    def move_east
      robot_position.x_coordinate += 1
    end

    def move_south
      robot_position.y_coordinate -= 1
    end

    def move_west
      robot_position.x_coordinate -= 1
    end

    def valid_movement?
      constraint.valid_move_parameters?
    end

    def constraint
      Constraint.new(robot_position.x_coordinate,robot_position.y_coordinate,robot_direction)
    end

    def move_error
      puts "Sorry this move is out of bounds"
    end

    def place_error
      puts "Sorry Robot not placed yet, please begin with a PLACE command"
    end
end
