class UsersController < ApplicationController
  
  def create
    @user = User.new(@params[:user])
    if request.post?  
      if @user.save
        session[:user] = User.authenticate(@user.username, @user.password)
        flash[:message] = "Signup successful"
        redirect_to :action => root_url
      else
        flash[:warning] = "Signup unsuccessful"
      end
    end

  end
end
