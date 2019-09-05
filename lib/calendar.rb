
module Hotel
  class Calendar
    attr_reader :start_date,:end_date,:date_range
    
    def initialize(start_date,end_date)
      start_date = Date.parse(start_date)
      end_date = Date.parse(end_date)

      if start_date < end_date
        @start_date = start_date
        @end_date = end_date
      else
        raise ArgumentError.new("End Date cannot be before Start Date")
      end

      @date_range = (@start_date..@end_date).to_a
    end
    
  end
end
