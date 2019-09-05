require_relative 'reservation'
require_relative 'room'
require_relative 'calendar'
require 'pry'

module Hotel
  class Booker
    attr_reader :rooms
    attr_accessor :reservations, :start_date,:end_date
    
    def initialize
      @reservations = []
      @start_date = nil
      @end_date = nil
      
      @rooms = []
      i = 0
      20.times do
        room = Hotel::Room.new(i+1)
        @rooms << room
        i += 1
      end
      
    end

    def available_rooms_list(start_date,end_date)
      available_rooms_list = []
      start_date = Date.parse(start_date)
      end_date = Date.parse(end_date)
      searching_date_range = (start_date..end_date).to_a
      
      @reservations.each do |reservation|
        if (reservation.date_range & searching_date_range).empty?
          available_rooms_list << reservation
        end
      end

      return available_rooms_list
    end
    
    def reserve_room (start_date,end_date)
      new_reservation = Hotel::Reservation.new(start_date,end_date)

      new_reservation.room_no = @rooms.sample

      @reservations << new_reservation
      return new_reservation
    end
    
    def find_by_date(date)
      reservations_return = []
      date = Date.parse(date)
      
      @reservations.each do |reservation|
        if date >= reservation.start_date && date <= reservation.end_date
          reservations_return << reservation
        end
      end
      return reservations_return
    end
  end
end
