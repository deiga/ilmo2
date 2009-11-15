class SessionsController < ApplicationController
  
  skip_before_filter :authentication_required
  
  def index
    
  end
  
  def create
    @user = User.new(params[:user])
    if request.post? 
      if User.authenticate(@user.username, @user.password)
        session[:user] = User.authenticate(@user.username, @user.password)
        redirect_to root_url
      else
        flash[:notice] = "Login unsuccessful"
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
