class Carnival
    @@carnival_revenue = 0

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
        @rides.each do |ride|
            ride.rider_log.max_by do |visitor, count|
                count
            end
        end
    end
end