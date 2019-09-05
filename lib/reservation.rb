require 'SecureRandom'
require 'pry'

module Hotel
  class Reservation
    attr_reader :start_date, :end_date, :nightly_rate

    SECONDS_TO_DAY = 86400

    def initialize(start_date,end_date)
    @id = SecureRandom.hex(6)
    @start_date = start_date
    @end_date = end_date
    @nightly_rate = 200
    end

    def total_cost
      duration = end_date - start_date
      total_cost = (duration/SECONDS_TO_DAY) * @nightly_rate
      return total_cost
    end
  end
end
