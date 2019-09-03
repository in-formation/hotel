require_relative 'test_helper'

require 'pry'

describe "initialize" do
  it "should create a valid instance of room" do
    # Arrange
    i = 0
    20.times do
      room = Hotel::Room.new(i+1)
      # Assert
      expect( room ).must_be_instance_of Hotel::Room
      i + 1
    end
  end
end

describe "self.all method" do
  it "should return an array of all room instances" do
    #Arrange
    i = 0
    rooms = []
    20.times do
      room = Hotel::Room.new(i+1)
      rooms << room
      i + 1
    end

    #Assert
    expect( rooms ).must_be_kind_of Array
  end
end
