require 'spec_helper'

describe Right do
  before(:each) do
    @valid_attributes = {
      :user_id => 2,
      :role_id => 2
    }
  end

  it "should create a new instance given valid attributes" do
    Right.create!(@valid_attributes)
  end
end
