require 'spec_helper'

describe Element do 
  context "#initialize" do 
  end

  context "#is_solved?" do 
    let(:element) { Element.new('foo', 'bar') }

    context "with no 0's" do 
      it "returns true" do 
        element.stub(:numbers) { '123456789' }
        element.is_solved?.should be_true
      end
    end

    context "with some 0's" do 
      it "returns false" do 
        element.stub(:numbers) { '123456780' }
        element.is_solved?.should be_false
      end
    end

  end


end