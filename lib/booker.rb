require_relative 'reservation'
require_relative 'room'
require_relative 'Calendar'
require 'pry'

module Hotel
  class Booker
    attr_accessor :reservations, :start_date,:end_date
    
    def initialize
      @reservations = []
      @start_date = nil
      @end_date = nil
    end
    
    def reserve_room (start_date,end_date)
      valid_dates = Hotel::Calendar.new(start_date,end_date)
      if valid_dates
        new_reservation = Hotel::Reservation.new(start_date,end_date)
        @reservations << new_reservation
        return new_reservation
      end
    end
    
    def find_by_date(date)
      reservations_return = []
      date = Time.parse(date)
      @reservations.each do |reservation|
        if date >= reservation.start_date && date <= reservation.end_date
          reservations_return << reservation
        end
      end
      return reservations_return
    end
  end
end
