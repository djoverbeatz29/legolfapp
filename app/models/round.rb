class Round < ApplicationRecord
    belongs_to :golfer
    belongs_to :course

    before_validation :date_time_parser

    validates_presence_of :tee_time

    def date_time_handler(tee_time)
        @month = tee_time[:month]
        @day = tee_time[:day]
        @hour = tee_time[:hour]
        @minute = tee_time[:minute]
    end

    def date_time_parser
        if @month && @day && @hour && @minute
            self.tee_time = DateTime.parse("#{@day}/#{@month}/#{Time.now.year} #{@hour}:#{@minute}")
        end
    end

end