class SessionsController < ApplicationController
  
  skip_before_filter :authentication_required
  
  def index
    
  end
  
  def create
    @user = User.new(params[:user])
    if request.post? 
      if User.authenticate(@user.username, @user.password)
        tmpuser = User.authenticate(@user.username, @user.password)
        session[:user] = { :id => tmpuser.id, :username => tmpuser.username }
        redirect_to root_url
      else
        flash[:notice] = "Username and/or password were not correct!"
        redirect_to sessions_url
      end
    end
  end
  
  def login
  end
  
  def logout
    reset_session
    redirect_to root_url
  end
end
