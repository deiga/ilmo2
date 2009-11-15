class UsersController < ApplicationController

  skip_before_filter :authentication_required  
  
  def new
  end
  
  def edit
  end

  def create
    @user = User.new(params[:user])
    if request.post?  
      if @user.save
#        session[:user] = User.authenticate(@user.username, @user.password)
        flash[:notice] = "Account created"
        redirect_to sessions_url
      else
        flash[:notice] = "Signup unsuccessful"
        redirect_to new_user_url
      end
    end
  end

end
