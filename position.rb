class Position
  attr_accessor :x_coordinate, :y_coordinate, :direction

  def initialize(x,y,direction)
    @x_coordinate = x
    @y_coordinate = y
    @direction = direction
  end

  def to_string
    "#{@x_coordinate},#{@y_coordinate},#{@direction}"
  end
end
