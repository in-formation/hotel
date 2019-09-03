require 'SecureRandom'

module Hotel
  class Reservation
    
    def initialize(start_date,end_date)
    @id = SecureRandom.hex(6)
    @start_date = start_date
    @end_date = end_date
    end
  end
end
  