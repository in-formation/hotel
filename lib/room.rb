
module Hotel
  class Room
    attr_reader :room_number, :nightly_rate
    def initialize(room_number)
      @room_number = room_number
      @nightly_rate = 200
    end

    def self.all
      rooms = []
      i = 0
      20.times do
        room = new(i+1)
        rooms << room
        i += 1
      end
      return rooms
    end
  end
end
