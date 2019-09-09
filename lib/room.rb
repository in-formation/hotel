require 'pry'

module Hotel
  class Room
    attr_reader :room_number, :nightly_rate
    attr_accessor :reservations

    TOTAL_ROOMS = 20

    def initialize(room_number)
      @room_number = room_number
      @reservations = []
    end
  end
end
