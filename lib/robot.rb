class Robot
  attr_accessor :current_position

  def initialize
    @current_position = nil
  end

  def report
    if placed?
      puts @current_position.pretty_string
      return @current_position.pretty_string
    else
      place_error
    end
  end

  def placed?
    !@current_position.nil?
  end

  def place_error
    puts "Sorry Robot not placed yet, please begin with a PLACE command"
  end
end
