class Carnival
    attr_reader :name,
                :rides,
                :duration

    def initialize(name, start_date, end_date)
        @name = name
        @duration = (DateTime.parse(end_date) - DateTime.parse(start_date)).to_i
        @rides = []
    end

    def add_ride(ride)
        @rides << ride
    end

    def most_popular_ride
        @rides.max_by {|ride| ride.total_times_rode}
    end

    def most_profitable_ride
        @rides.max_by {|ride| ride.total_revenue}
    end

    def total_carnival_revenue
        @rides.sum {|ride| ride.total_revenue}
    end

    def total_visitors
        all_visitor_keys = []
        @rides.each{|ride| all_visitor_keys << ride.rider_log.keys}
        all_visitor_keys.flatten.uniq.size
    end
end