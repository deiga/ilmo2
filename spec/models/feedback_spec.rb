require 'spec_helper'

describe Feedback do
  before(:each) do
    @valid_attributes = {
      :course_instance_id => 1,
      :message => "value for message"
    }
  end

  it "should create a new instance given valid attributes" do
    Feedback.create!(@valid_attributes)
  end
end
