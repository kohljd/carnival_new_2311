require 'spec_helper'

RSpec.describe Carnival do
    before(:each) do
        @carnival = Carnival.new("Fun", "20230101", "20230131")
    end

    it "is a Carnival object" do
        expect(@carnival).to be_an_instance_of(Carnival)
    end

    it "has attributes" do
        expect(@carnival.name).to eq("Fun")
        expect(@carnival.duration).to eq(30)
    end

    it "can add rides" do
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        @carnival.add_ride(ride1)
        expect(@carnival.rides).to eq([ride1])
    end

    describe "most popular" do
        before(:each) do
            @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
            @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
            @carnival.add_ride(@ride1)
            @carnival.add_ride(@ride2)
            @visitor1 = Visitor.new('Bruce', 54, '$10')
            @visitor2 = Visitor.new('Tucker', 36, '$5')
            @visitor1.add_preference(:gentle)
            @visitor2.add_preference(:gentle)
        end

        it "can state most popular ride" do
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor2)
            @ride2.board_rider(@visitor2)
            expect(@carnival.most_popular_ride).to eq(@ride1)
        end
    end
end