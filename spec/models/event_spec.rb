require 'spec_helper'

describe Event do
  before(:each) do
    @valid_attributes = {
      :type => "value for type",
      :user_id => 1,
      :course_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Event.create!(@valid_attributes)
  end
end
