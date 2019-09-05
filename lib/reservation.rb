require 'SecureRandom'
require 'pry'

module Hotel
  class Reservation
    attr_reader :start_date, :end_date, :nightly_rate
    attr_accessor :room_no

    def initialize(start_date,end_date)
      @id = SecureRandom.hex(6)
      
      valid_dates = Hotel::Calendar.new(start_date,end_date)
      if valid_dates
        @start_date = valid_dates.start_date
        @end_date = valid_dates.end_date
      end

      @nightly_rate = 200
      @room_no = nil
    end

    def total_cost
      duration = end_date - start_date
      total_cost = duration * @nightly_rate
      return total_cost
    end
  end
end
