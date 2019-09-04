require_relative 'test_helper'

require 'pry'

describe "initialize" do
  it "should create a valid instance of room" do
    TOTAL_ROOMS = 20
    # Arrange
    i = 0
    TOTAL_ROOMS.times do
      room = Hotel::Room.new(i+1)
      # Assert
      expect( room ).must_be_instance_of Hotel::Room
      i += 1
    end
  end
end

describe "self.all method" do
  it "should return an array of all room instances" do
    #Arrange
    Hotel::Room.all

    #Assert
    expect(Hotel::Room.all).must_be_kind_of Array
  end
end
