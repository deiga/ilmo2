require 'spec_helper'

describe Newsfeed do
  before(:each) do
    @valid_attributes = {
      :message => "value for message"
    }
  end

  it "should create a new instance given valid attributes" do
    Newsfeed.create!(@valid_attributes)
  end
end
