require_relative 'test_helper'
require 'pry'

describe 'reserve_room' do
  it "should create a correct instance when reserving a room" do
    start_date = Time.parse("3/9/2019")
    end_date = Time.parse("5/9/2019")
    
    reserving_room = Hotel::Booker.new

    expect( reserving_room.reserve_room(start_date,end_date) ).must_be_instance_of Hotel::Reservation

    expect( reserving_room.reservations ).must_be_kind_of Array
  end

  it "should assign a random room" do
    start_date = Time.parse("3/9/2019")
    end_date = Time.parse("5/9/2019")
    
    reserving_room = Hotel::Booker.new
    
    reservation = reserving_room.reserve_room(start_date,end_date)
    
    expect( reservation.room_no ).must_be_instance_of Hotel::Room
  end
end

describe 'find_by_date' do
  it "should return an array" do
    start_date = Time.parse("3/9/2019")
    end_date = Time.parse("5/9/2019")

    reserving_room = Hotel::Booker.new

    reserving_room.reserve_room(start_date,end_date)

    expect( reserving_room.find_by_date("3/9/2019") ).must_be_kind_of Array
  end

  it "should return nil if no reservations if no date matched" do
    start_date = Time.parse("3/9/2019")
    end_date = Time.parse("5/9/2019")

    reserving_room = Hotel::Booker.new

    reserving_room.reserve_room(start_date,end_date)
    
    expect( reserving_room.find_by_date("1/9/2019") ).must_be_empty
  end
end

describe "find_available_room method" do

end
