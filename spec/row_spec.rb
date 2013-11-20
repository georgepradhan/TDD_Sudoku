require 'spec_helper'

describe Row do 
  it "is a row" do 
    expect(Row.new('a','b')).to be_a Row
  end
end