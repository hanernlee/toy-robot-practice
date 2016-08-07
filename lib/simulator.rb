require_relative 'robot'
require_relative 'table'
require_relative 'commander'

class Simulator
  def initialize
    @table = Table.new
    @robot = Robot.new
    @commander = Commander.new(@robot)
  end

  def run_simulator
    loop do
      puts "Please enter in a command"
      input = STDIN.gets.chomp.upcase
      break if input == "Q"
      @commander.execute(input)
    end
  end
end
