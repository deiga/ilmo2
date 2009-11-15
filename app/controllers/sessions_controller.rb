class SessionsController < ApplicationController
  
  skip_before_filter :authentication_required
  
  def index
    
  end
  
  def create
    session[:user] = true
    redirect_to root_url
  end
  
  def login
    
  end
  
  def logout
    reset_session
    redirect_to root_url
  end
end
