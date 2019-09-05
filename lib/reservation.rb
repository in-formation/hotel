require 'SecureRandom'

module Hotel
  class Reservation
    attr_reader :start_date, :end_date
    
    def initialize(start_date,end_date)
    @id = SecureRandom.hex(6)
    @start_date = start_date
    @end_date = end_date
    #push this object into self.save all resrvations
    end

    def self.find_by_date(search_date)
      reservations_by_date = []
      return reservations_by_date
    end

    # def self.save_all_reservation
    # end
  end
end
