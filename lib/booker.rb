require_relative 'reservation'
require_relative 'room'

module Hotel
  class Booker
    attr_accessor :reservations
    
    def initialize
      @reservations = []
    end
    
    def reserve_room (start_date,end_date)
      new_reservation = Hotel::Reservation.new(start_date,end_date)
      @reservations << new_reservation
      return new_reservation
    end
    
    def find_by_date(date)
      reservations_return = []
      @reservations.each do |reservation|
        if reservation.include?(date)
          reservations_return << reservation
        end
      end
      return reservations_return
    end
  end
end
