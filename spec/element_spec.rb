require 'spec_helper'

describe Element do 
  context "#initialize" do 
  end

  context "#sum" do 
    let(:element) { Element.new('123456789') }
    it "returns the sum" do 
      element.sum.should eq 45
    end
  end
end