require_relative 'test_helper'
require 'pry'

describe "Booker Testing" do
  describe "initialize" do
    it "should return a list of all the rooms in the hotel" do
      reserving_room = Hotel::Booker.new

      expect( reserving_room.rooms ).must_be_kind_of Array

      reserving_room.rooms.each do |room|
        expect( room ).must_be_instance_of Hotel::Room
      end

    end
  end

  describe 'reserve_room' do
    it "should create a correct instance when reserving a room" do
      start_date = "3/9/2019"
      end_date = "5/9/2019"
      
      reserving_room = Hotel::Booker.new

      expect( reserving_room.reserve_room(start_date,end_date) ).must_be_instance_of Hotel::Reservation

      expect( reserving_room.reservations ).must_be_kind_of Array
    end

    it "should assign a random room" do
      start_date = "3/9/2019"
      end_date = "5/9/2019"
      
      reserving_room = Hotel::Booker.new
      
      reservation = reserving_room.reserve_room(start_date,end_date)
      
      expect( reservation.room_no ).must_be_instance_of Hotel::Room
    end
  end

  describe 'find_by_date' do
    it "should return an array" do
      start_date = "3/9/2019"
      end_date = "5/9/2019"
      
      reserving_room = Hotel::Booker.new

      reserving_room.reserve_room(start_date,end_date)
      
      expect( reserving_room.find_by_date("3/9/2019") ).must_be_kind_of Array
    end

    it "should return nil if no reservations if no date matched" do
      start_date = "3/9/2019"
      end_date = "5/9/2019"

      reserving_room = Hotel::Booker.new

      reserving_room.reserve_room(start_date,end_date)
      
      expect( reserving_room.find_by_date("1/9/2019") ).must_be_empty
    end
  end

  describe "find_available_room method" do
    it "should return available roooms for given date range" do
      start_date = "3/9/2019"
      end_date = "5/9/2019"
      reserving_room = Hotel::Booker.new
      reserving_room.reserve_room(start_date,end_date)

      checking_room = Hotel::Booker.new
      rooms_available = checking_room.available_rooms_list("6/9/2019","7/9/2019")

      expect( rooms_available ).must_be_kind_of Array

      rooms_available.each do |room|
        expect(room).must_be_instance_of Hotel::Room
      end
    end

    it "should properly handle overlapping dates" do
      start_date = "3/9/2019"
      end_date = "5/9/2019"
      reserving_room = Hotel::Booker.new
      reserving_room.reserve_room(start_date,end_date)

      checking_room = Hotel::Booker.new
      rooms_available = checking_room.available_rooms_list("4/9/2019","6/9/2019")
      
      expect( rooms_available ).must_be_empty
    end

    it "should return nil if no reservations available for given date range" do

    end

    it "should raise an Argument Error if given date range invalid" do

    end
  end
end
