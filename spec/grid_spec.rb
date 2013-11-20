require 'spec_helper'

describe Grid do 
  context "#initialize" do 

    it "rejects bad input" do
      expect {
        Grid.new('this is not a grid')
      }.to raise_error
    end

    it "allows good input" do 
      expect(Grid.new('0'*81)).to be_a Grid
    end

    it "generates appropriate row objects" do
      Row.should_receive(:new).exactly(9).times
      Grid.new('1'*9 +
               '2'*9 +
               '3'*9 +
               '4'*9 +
               '5'*9 +
               '6'*9 +
               '7'*9 +
               '8'*9 +
               '9'*9 )
    end
  end
end