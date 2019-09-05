require_relative 'test_helper'

describe "initialize" do
  it "creates a valid instance of Reservation" do
    start_date = Time.parse("3/9/2019")
    end_date = Time.parse("5/9/2019")
    
    new_reservation = Hotel::Reservation.new(start_date,end_date)

    expect( new_reservation ).must_be_instance_of Hotel::Reservation
  end
end

describe "total_date" do
  it "correctly calculates total_cost" do
    start_date = Time.parse("3/9/2019")
    end_date = Time.parse("5/9/2019")

    new_reservation = Hotel::Reservation.new(start_date,end_date)
    
    expect( new_reservation.total_cost ).must_equal 400.00
  end
end
