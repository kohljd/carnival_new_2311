require 'spec_helper'

RSpec.describe visitor do
    it "is a Visitor object" do
        visitor1 = Visitor.new('Bruce', 54, '$10')
        expect(visitor).to be_an_instance_of(Visitor)
    end

    it "can state visitor's details" do
        visitor1 = Visitor.new('Bruce', 54, '$10')
        expect(visitor1.name).to eq("Bruce")
        expect(visitor1.height).to eq(54)
        expect(visitor1.spending_money).to eq("$10")
    end

    it "starts with no preferences" do
        visitor1 = Visitor.new('Bruce', 54, '$10')
        expect(visitor1.preferences).to eq([])
    end

    it "can add preferences" do
        visitor1 = Visitor.new('Bruce', 54, '$10')
        visitor1.add_preference(:gentle)
        visitor1.add_preference(:thrilling)
        expect(visitor1.preferences).to eq([:gentle, :thrilling])
    end

    it "checks if tall enough for ride" do
        visitor1 = Visitor.new('Bruce', 54, '$10')
        visitor2 = Visitor.new('Tucker', 36, '$5')
        visitor3 = Visitor.new('Penny', 64, '$15')

        expect(visitor1.tall_enough?(54)).to be true
        expect(visitor2.tall_enough?(54)).to be false
        expect(visitor3.tall_enough?(54)).to be true
        expect(visitor1.tall_enough?(64)).to be false
    end
end