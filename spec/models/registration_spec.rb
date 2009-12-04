require 'spec_helper'

describe Registration do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :exercise_group_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Registration.create!(@valid_attributes)
  end
end