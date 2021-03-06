require 'spec_helper'

describe Grid do 
  let(:grid) { Grid.new('1'*9 + '2'*9 + '3'*9 + '4'*9 +
                '5'*9 + '6'*9 + '7'*9 + '8'*9 + '9'*9 ) }

  context "#initialize" do 
    it "rejects bad input" do
      expect {
        Grid.new('this is not a grid')
      }.to raise_error
    end

    it "allows good input" do 
      expect(Grid.new('0'*81)).to be_a Grid
    end

    it "generates 9 Rows, 9 Columns, and 9 Boxes" do
      Row.should_receive(:new).exactly(9).times
      Column.should_receive(:new).exactly(9).times
      Box.should_receive(:new).exactly(9).times

      Grid.new('0'*81) 
    end
  end

  describe "#create_rows" do 
    it "generates row objects appropriately" do 
      grid.rows.first.numbers.should eq '111111111'
      grid.rows.last.numbers.should eq  '999999999'
    end
  end

  describe "#create_columns" do 
    it "generates column objects appropriately" do 
      grid.columns.first.numbers.should eq '123456789'
      grid.columns.last.numbers.should eq  '123456789'
    end
  end

  describe "#create_boxes" do 
    it "generates box objects appropriately" do 
      grid.boxes.first.numbers.should eq '111222333'
      grid.boxes.last.numbers.should eq  '777888999'
    end
  end

  describe "#get_row" do 
    it "returns the right row" do 
      expect(grid.get_row(0).numbers).to eq '111111111'
      expect(grid.get_row(9).numbers).to eq '222222222'
    end
  end

  describe "#get_column" do 
    it "returns the right column" do 
      expect(grid.get_column(0).numbers).to eq '123456789'
      expect(grid.get_column(10).numbers).to eq '123456789'
    end
  end

  describe "#get_box" do 
    it "returns the right box" do
      expect(grid.get_box(0).numbers).to eq '111222333'
      expect(grid.get_box(16).numbers).to eq '111222333'
    end
  end

  describe "#is_solved?" do
    context "with no 0's" do      
      let(:grid) { Grid.new('1'*81) } 
      it "returns true" do 
        grid.is_solved?.should be_true
      end
    end

    context "with some 0's" do 
      let(:grid) { Grid.new('1'*80+'0') } 
      it "returns false" do 
        grid.is_solved?.should be_false
      end
    end
  end

  describe "#sum_of_neighbors" do 
    it "returns the right sum" do 
      grid.sum_of_neighbors(0).should eq (1..9).reduce(:+)
    end
  end

end