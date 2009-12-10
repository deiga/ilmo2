require 'spec_helper'

describe CoursesController do

  describe "routes" do

    it "should route the root to index" do
      params_from(:get, "/").should == {:controller => "courses", :action => "index"}
    end
      
  end

  
  before(:each) do
     @course_mock = mock_model(Course)
  end

    describe "index" do
      
    it "should redirect to login url" do
      get :index
      response.should redirect_to(login_url)
    end

    # hitting database, this behaviour should be tested at unit tests
    # so we don't want to do this..
    it "should find all courses from db" do
      fake_as_authenticated!
      
      descr = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
      # test-database is empty so we have to create something in it
        Course.create! :title => "Rails and rSpec", :description => descr
        Course.create! :title => "Rails and rSpec2", :description => descr
        Course.create! :title => "Rails and rSpec3", :description => descr
        
      # make get request to application
      get :index
      
      # should assign @courses with 3 objects from database
      assigns(:courses).should have(23).members
    end
    
    # ..but instead use mocks 
    it "should find all courses" do
      fake_as_authenticated!
      # we bypass hitting database and just check that method ".all" gets called
      # and returns mock object defined above
      
      Course.should_receive(:all).and_return([@course_mock])
      
      get :index
    
      assigns(:courses).should == [@course_mock]
    end
    
  end
  
  
  describe "show" do

    it "should find correct course" do       
       # our before filter works also in here!         
       fake_as_authenticated!

       course_mock = mock_model(Course)
       Course.should_receive(:find).with("12").and_return(@course_mock)

       # Rails stack converts integer 12 to "12", as our assertion in above shows
       get :show, :id => 12
   
       assigns(:course).should == @course_mock
    end
    
  end

end
