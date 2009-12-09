require 'spec_helper'

describe "/feedbacks/destroy" do
  before(:each) do
    render 'feedbacks/destroy'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/feedbacks/destroy])
  end
end
