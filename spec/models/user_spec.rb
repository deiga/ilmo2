require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :username => "john",
      :password => "secretret"
    }
    
    @valid_user = User.new(@valid_attributes)
  end

  describe "creation" do
    it "should create a new instance given valid attributes" do
      User.create!(@valid_attributes)
    end
    
    it "should lowercase username" do
       user = User.create!(@valid_attributes.merge({:username => "john"}))
       user.username.should == "john"
    end
  end

  describe "validation" do
    it "should require username to be between 4 and 40 characters" do
      user = User.new(@valid_attributes)
      user.should be_valid
      
      user.username = "abc"
      user.should_not be_valid
      
      user.username = "a"*46
      user.should_not be_valid
    end
    
    it "should have a password" do
      @valid_user.password = ""
      @valid_user.should have(1).errors_on(:password)
    end
    
    it "should require confirmation of password" do
      @valid_user.password_confirmation = ""
      @valid_user.should have(1).errors_on(:password)
      
    end
    
  end
  
end
