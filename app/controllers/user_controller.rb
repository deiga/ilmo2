class UserController < ApplicationController
  def register
    @user = User.new(@params[:user])
    if request.post?  
      if @user.save
        session[:user] = User.authenticate(@user.username, @user.password)
        flash[:message] = "Registering successful"
        redirect_to :action => "welcome"          
      else
        flash[:warning] = "Registering unsuccessful"
      end
    end
  end

  def login
    if request.post?
      if session[:user] = User.authenticate(params[:user][:username], params[:user][:password])
        flash[:message]  = "Login successful"
        redirect_to_stored
      else
        flash[:warning] = "Login unsuccessful"
      end
    end
  end

  def logout
  end
  
  def welcome
  end
  def hidden
  end

end
