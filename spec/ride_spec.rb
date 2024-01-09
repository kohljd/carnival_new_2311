require 'spec_helper'

RSpec.describe Ride do
    before(:each) do
        @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    end

    it "is a Ride object" do
        expect(@ride1).to be_an_instance_of(Ride)
    end

    it "can state ride attributes" do
        expect(@ride1.min_height).to eq(24)
        expect(@ride1.admission_fee).to eq(1)
        expect(@ride1.excitement).to eq(:gentle)
        expect(@ride1.total_revenue).to eq(0)
    end

    describe "ride and visitor interaction" do
        before(:each) do
            @visitor1 = Visitor.new('Bruce', 54, '$10')
            @visitor2 = Visitor.new('Tucker', 36, '$5')
            @visitor1.add_preference(:gentle)
            @visitor2.add_preference(:gentle)
        end

        it "has a rider log" do
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor2)
            @ride1.board_rider(@visitor1)
            expect(@ride1.rider_log).to eq({@visitor1 => 2, @visitor2 => 1})
        end

        it "charges for ride" do
            expect(@visitor1.spending_money).to eq(10)
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor1)
            expect(@visitor1.spending_money).to eq(8)
        end

        it "calculates total revenue" do
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor2)
            @ride1.board_rider(@visitor1)
            expect(@ride1.total_revenue).to eq(3)
        end

        it "requires height, matching pref, & enough $ to ride" do
            ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
            ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

            visitor3 = Visitor.new('Penny', 64, '$15')
            visitor3.add_preference(:thrilling)
            visitor3.add_preference(:gentle)
            @visitor2.add_preference(:thrilling)

            ride3.board_rider(@visitor1)
            ride3.board_rider(@visitor2)
            ride3.board_rider(visitor3)
            #no matching preference
            expect(@visitor1.spending_money).to eq(10)
            
            #not tall enough
            expect(@visitor2.spending_money).to eq(5)

            #meets req
            expect(visitor3.spending_money).to eq(13)

            #not enough money
            ride2.board_rider(visitor3)
            ride2.board_rider(visitor3)
            ride2.board_rider(visitor3)
            expect(visitor3.spending_money).to eq(3)

            #check ride 3 revenue
            expect(ride3.total_revenue).to eq(2)
        end
    end
end