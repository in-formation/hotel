
module Hotel
  class Calendar
    attr_reader :start_date,:end_date
    
    def initialize(start_date,end_date)
      
      if start_date < end_date
        @start_date = start_date
        @end_date = end_date
      else
        raise ArgumentError.new("End Date cannot be before Start Date")
      end
    end
    
  end
end
