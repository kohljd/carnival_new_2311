require 'spec_helper'

RSpec.describe Carnival do
    before(:each) do
        @carnival = Carnival.new("Fun", (20231,1), (2023,1,31))
    end

    it "is a Carnival object" do
        expect(@carnival).to be_an_instance_of(Carnival)
    end

    it "has attributes" do
        expect(@carnival.name).to eq("Fun")
        expect(@carnival.duration).to eq(31)
    end

    xit "can add rides" do
        c@arnival.add_ride(ride1)
        expect(carnival.rides).to eq([ride1])
    end
end