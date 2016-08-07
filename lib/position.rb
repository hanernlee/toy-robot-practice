class Position
  attr_accessor :x_coordinate, :y_coordinate, :direction

  def initialize(x,y,direction)
    @x_coordinate = x
    @y_coordinate = y
    @direction = direction
  end

  def pretty_string
    "#{@x_coordinate},#{@y_coordinate},#{@direction}"
  end

  #overriding == method used to check equivalence of two objects
  def ==(other)
    @x_coordinate == other.x_coordinate && @y_coordinate == other.y_coordinate && @direction == other.direction
  end
end
