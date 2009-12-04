require 'spec_helper'

describe Rights do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :role_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Rights.create!(@valid_attributes)
  end
end
