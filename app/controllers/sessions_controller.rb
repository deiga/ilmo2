class SessionsController < ApplicationController
  
  skip_before_filter :authentication_required
  
  def create
    @user = User.new(params[:user])
    authenticated_user = User.authenticate(@user.username, @user.password)
    if authenticated_user
      log_user_in(authenticated_user)
      redirect_to root_url
    else
      flash[:notice] = "Username and/or password were not correct!"
      redirect_to login_url
    end
  end
  
  def destroy
    begin
      reset_session
    rescue
    ensure
      redirect_to root_url
    end
  end
end
