COMPASS = ["NORTH","EAST","SOUTH","WEST"]

class RotateCommand
  def initialize(input,robot)
    @input = input
    @robot = robot
  end

  def execute
    if @robot.placed?
      if input_rotate_left?
        rotate_left
      else
        rotate_right
      end
    else
      place_error
    end
  end

  private

    def rotate_left
      @robot.current_position.direction = COMPASS[(COMPASS.index(@robot.current_position.direction) - 1) % 4]
    end

    def rotate_right
      @robot.current_position.direction = COMPASS[(COMPASS.index(@robot.current_position.direction) + 1) % 4]
    end

    def input_rotate_left?
      @input =~ /^LEFT$/
    end

    def place_error
      puts "Sorry Robot not placed yet, please begin with a PLACE command"
    end
end
