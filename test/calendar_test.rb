require_relative 'test_helper'
require 'pry' 
describe "Calendar Testing" do
  describe "initialize Calendar" do
    it "should correctly validate start and end dates" do
      start_date = "3/9/2019"
      end_date = "5/9/2019"
      
      date_check = Hotel::Calendar.new(start_date,end_date)
      
      expect( date_check ).must_be_instance_of Hotel::Calendar
    end

    it "should raise an argument error if dates are invalid" do
      end_date = "3/9/2019"
      start_date = "5/9/2019"
      
      expect{Hotel::Calendar.new(start_date,end_date)}.must_raise ArgumentError
    end
  end
end
