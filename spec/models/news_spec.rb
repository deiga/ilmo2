require 'spec_helper'

describe News do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    News.create!(@valid_attributes)
  end
end
