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

    it "generates 9 row objects" do
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

  context "#create_rows" do 
    let(:grid) { Grid.new('1'*9 + '2'*9 + '3'*9 + '4'*9 +
                  '5'*9 + '6'*9 + '7'*9 + '8'*9 + '9'*9 ) }

    it "generates row objects appropriately" do 
      grid.rows.first.numbers.should eq '111111111'
    end
  end
end