require 'spec_helper'

describe FeedbacksController do

  #Delete these examples and add some real ones
  it "should use FeedbacksController" do
    controller.should be_an_instance_of(FeedbacksController)
  end


  describe "GET 'create'" do
    it "should be successful" do
      get 'create'
      response.should be_success
    end
  end

end
