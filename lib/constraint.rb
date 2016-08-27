require_relative 'table'

class Constraint
  def initialize(x,y,direction)
    @table = Table.new
    @x_coordinate = x
    @y_coordinate = y
    @direction = direction
  end

  def valid_place_parameters?
    if valid_parameters?
      true
    else
      false
    end
  end

  def valid_move_parameters?
    if valid_north?
      true
    elsif valid_east?
      true
    elsif valid_south?
      true
    elsif valid_west?
      true
    else
      false
    end
  end

  private

    def valid_parameters?
      COMPASS.include?(@direction) && @x_coordinate <= @table.width && @y_coordinate <= @table.length
    end

    def valid_north?
      @direction == COMPASS[0] && @y_coordinate < @table.length
    end

    def valid_east?
      @direction == COMPASS[1] && @x_coordinate < @table.width
    end

    def valid_south?
      @direction == COMPASS[2] && @y_coordinate > 0
    end

    def valid_west?
      @direction == COMPASS[3] && @x_coordinate > 0
    end
end
