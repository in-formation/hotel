
module Hotel
  class Room
    attr_reader :room_number, :nightly_rate
    def initialize(room_number)
      @room_number = room_number
      @nightly_rate = 200
    end
  end
end
