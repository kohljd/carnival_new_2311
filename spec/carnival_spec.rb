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

    it "can state most popular ride" do
        
    end
end