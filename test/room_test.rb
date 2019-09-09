require_relative 'test_helper'
require 'pry'

describe "Room Testing" do
  describe "initialize" do
    it "should create a valid instance of room" do
      TOTAL_ROOMS = 20
      i = 0
      TOTAL_ROOMS.times do
        room = Hotel::Room.new(i+1)
        expect( room ).must_be_instance_of Hotel::Room
        i += 1
      end
    end
  end
end
