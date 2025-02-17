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
  
  describe "find_available_room method" do
    it "should return available roooms for given date range" do
      start_date = "3/9/2019"
      end_date = "5/9/2019"
      reserving_room = Hotel::Booker.new
      reserving_room.reserve_room(start_date,end_date)
      
      checking_rooms = reserving_room.available_rooms_list("6/9/2019","7/9/2019")
      
      expect( checking_rooms ).must_be_kind_of Array
      
      checking_rooms.each do |room|
        expect(room).must_be_instance_of Hotel::Room
      end
    end
    
    it "should properly handle one reservation having the same check OUT date as another reservation's check IN date by showing that the room is available" do
      start_date = "3/9/2019"
      end_date = "5/9/2019"
      reserving_room = Hotel::Booker.new
      reserving_room.reserve_room(start_date,end_date)
      
      checking_rooms = reserving_room.available_rooms_list("4/9/2019","6/9/2019")
      
      expect( checking_rooms ).must_be_empty
    end
    
    it "should properly handle check out and check in dates overlapping as the same date" do
      start_date = "3/9/2019"
      end_date = "5/9/2019"
      reserving_room = Hotel::Booker.new
      reserving_room.reserve_room(start_date,end_date)
      
      checking_rooms = reserving_room.available_rooms_list("5/9/2019","6/9/2019")
      
      expect( checking_rooms ).must_be_kind_of Array
      
      checking_rooms.each do |room|
        expect(room).must_be_instance_of Hotel::Room
      end
    end
    
    it "should raise an Argument Error if given date range invalid" do
      start_date = "3/9/2019"
      end_date = "5/9/2019"
      reserving_room = Hotel::Booker.new
      reserving_room.reserve_room(start_date,end_date)
      
      expect{ reserving_room.available_rooms_list("5/9/2019","4/9/2019")}.must_raise ArgumentError
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
  end
  
  describe "assign_available_room" do
    it "should assign a room that is NOT already booked" do
      start_date = "3/9/2019"
      end_date = "5/9/2019"
      reserving_room = Hotel::Booker.new
      reservation_1 = reserving_room.reserve_room(start_date,end_date)
      expect( reservation_1.room_no ).must_be_instance_of Hotel::Room
      
      start_date = "3/9/2019"
      end_date = "4/9/2019"
      reservation_2 = reserving_room.reserve_room(start_date,end_date)
      expect( reservation_2.room_no ).must_be_instance_of Hotel::Room
      
      expect( reservation_2.room_no.room_number ).wont_be_same_as reservation_1.room_no.room_number
    end
    
    it "should raise a standard error if no rooms are available" do
      start_date = "3/9/2019"
      end_date = "5/9/2019"
      reserving_room = Hotel::Booker.new
      
      20.times do
        reserving_room.reserve_room(start_date,end_date)
      end
      
      expect{reserving_room.reserve_room(start_date,end_date)}.must_raise StandardError
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
end
