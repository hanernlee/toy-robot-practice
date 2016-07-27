require_relative 'robot'
require_relative 'table'
require_relative 'commander'

class Simulator
  def initialize
    @table = Table.new
    @robot = Robot.new
    @commander = Commander.new(@robot)
    run_simulator
  end

  private

  def run_simulator
    loop do
      puts "Please enter in a command"
      input = gets.chomp.upcase
      break if input == "Q"
      @commander.execute(input)
    end
  end
end
