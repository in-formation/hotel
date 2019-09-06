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
      valid_dates = Hotel::Calendar.new(start_date,end_date)
      if valid_dates

        available_rooms_list = []
        start_date = Date.parse(start_date)
        end_date = Date.parse(end_date)
        searching_date_range = (start_date..(end_date-1)).to_a
        
        @reservations.each do |reservation|
          if (reservation.date_range & searching_date_range).empty?
            available_rooms_list << reservation.room_no
          end
        end
        
      end

      return available_rooms_list
    end
    
    def reserve_room (start_date,end_date)
      new_reservation = Hotel::Reservation.new(start_date,end_date)
      
      room_assignment = assign_available_room(new_reservation)
      new_reservation.room_no = room_assignment
      room_assignment.reservations << new_reservation

      @reservations << new_reservation
      return new_reservation
    end

    def assign_available_room(new_reservation)
      @rooms.each do |room|
        if room.reservations.length == 0
          return room
        else
          room.reservations.each do |reservation|
            if (reservation.date_range & new_reservation.date_range).empty?
              return room
            end
          end
        end
      end
      raise StandardError.new("No available rooms")
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
