require 'spec_helper'

describe Row do 
  context "#initialize" do 
  end

  context "#is_solved?" do 
    let(:row) { Row.new('foo', 'bar') }

    context "with no 0's" do 
      it "returns true" do 
        row.stub(:numbers) { '123456789' }
        row.is_solved?.should be_true
      end
    end

    context "with some 0's" do 
      it "returns false" do 
        row.stub(:numbers) { '123456780' }
        row.is_solved?.should be_false
      end
    end

  end


end