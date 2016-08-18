require 'spec_helper'
require 'position'
require 'robot'
require 'table'
require 'constraint'
require 'compass'
require 'place_command'
require 'report_command'
require 'move_command'
require 'rotate_command'

describe Robot do
  let(:robot) { Robot.new }

  describe '#place' do
    context 'valid place position' do
      let (:position) { Position.new(2,2,'NORTH') }

      before do
        PlaceCommand.new('PLACE 2,2,NORTH',robot).execute
      end

      it "places robot at valid position" do
        expect(robot.current_position).to eq position
      end
    end
  end

  describe 'invalid place position' do
    context 'invalid position' do
      let (:constraint) { Constraint.new(8,8,'NORTH') }

      before do
        PlaceCommand.new('PLACE 8,8,NORTH',robot).execute
      end

      it "will not place robot at invalid position" do
          expect(constraint.valid_place_parameters?).to be false
      end
    end
  end

  describe '#report' do
    context 'report positions of robot'
      before do
        PlaceCommand.new('PLACE 2,2,EAST',robot).execute
      end

      it 'reports current position of robot' do
        expect(robot.report).to eq('2,2,EAST')
      end
  end

  describe '#move' do
    context 'when robot placed on table' do
      it 'lets ROBOT move NORTH' do
        PlaceCommand.new('PLACE 0,0,NORTH',robot).execute
        MoveCommand.new(robot).execute
        expect(robot.report).to eq('0,1,NORTH')
      end

      it 'lets ROBOT move SOUTH' do
        PlaceCommand.new('PLACE 0,2,SOUTH',robot).execute
        MoveCommand.new(robot).execute
        expect(robot.report).to eq('0,1,SOUTH')
      end

      it 'lets ROBOT move EAST' do
        PlaceCommand.new('PLACE 0,0,EAST',robot).execute
        MoveCommand.new(robot).execute
        expect(robot.report).to eq('1,0,EAST')
      end

      it 'lets ROBOT move WEST' do
        PlaceCommand.new('PLACE 1,0,WEST',robot).execute
        MoveCommand.new(robot).execute
        expect(robot.report).to eq('0,0,WEST')
      end
    end
  end

  describe '#rotate' do
    context 'when robot placed on table' do
      before do
        PlaceCommand.new('PLACE 0,0,NORTH',robot).execute
      end

      it 'lets ROBOT rotate left' do
        input = 'LEFT'
        RotateCommand.new(input,robot).execute
        expect(robot.report).to eq('0,0,WEST')
      end

      it 'lets ROBOT rotate right' do
        input = 'RIGHT'
        RotateCommand.new(input,robot).execute
        expect(robot.report).to eq('0,0,EAST')
      end
    end
  end
end
