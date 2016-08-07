require 'pry'
require 'spec_helper'
require 'position'
require 'robot'
require 'table'
require 'constraint'
require 'compass'
require 'place_command'
require 'report_command'

describe Robot do
  let(:robot) { Robot.new }

  describe 'valid #place' do
    before do
      PlaceCommand.new('PLACE 2,2,NORTH',robot).execute
    end

    context 'valid position' do
      let (:position) { Position.new(2,2,'NORTH') }

      it "places robot at valid position" do
        expect(robot.current_position).to eq position
      end
    end
  end

  describe 'invalid #place' do
    before do
      PlaceCommand.new('PLACE 8,8,NORTH',robot).execute
    end

    context 'invalid position' do
      let (:constraint) { Constraint.new(8,8,'NORTH') }

      it "will not place robot at invalid position" do
          expect(constraint.valid_place_parameters?).to be false
      end
    end
  end

  describe '#report' do
    before do
      PlaceCommand.new('PLACE 2,2,EAST',robot).execute
    end

    context 'before place'
      it 'reports current position of robot' do
        expect(robot.report). to eq '2,2,EAST'
      end
  end

end
