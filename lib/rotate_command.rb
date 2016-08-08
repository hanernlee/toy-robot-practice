require_relative 'compass'

class RotateCommand
  def initialize(input,robot)
    @input = input
    @robot = robot
  end

  def execute
    if input_rotate_left?
      rotate_left
    else
      rotate_right
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
end
