class UsersController < ApplicationController

  skip_before_filter :authentication_required  
  
  def new
    @user = User.new
  end
  
  def edit
    if params[:id].to_i != (session[:user][:id])
      flash[:notice] = 'You are not allowed to edit other users!'
      redirect_to root_url
    end
    @user = User.find session[:user][:id]
  end
  
  def update

    if request.put?
      user = User.find params[:id]
      user.realname = params[:user][:realname]
      user.studentnumber = params[:user][:studentnumber]
      if user.studentnumber.empty?
        user.studentnumber = nil
      end
      if params[:user][:password].length > 0
        user.password = params[:user][:password]
        user.password_confirmation = params[:user][:password_confirmation]
      end
      if user.save
        flash[:msg] = 'Account updated'
        redirect_to root_url
      else
        raise user.errors.inspect
        flash[:notice] = 'Update unsuccessful'
        redirect_to edit_user_url params[:id]
      end
    end
  end
  
  def destroy
    raise params.inspect
    User.delete params[:id]
    session[:user] = nil
    flash[:msg] = "Account removed successfully"
    redirect_to sessions_url
  end

  def create
    @user = User.new(params[:user])
    if request.post?  
      if @user.save
        flash[:msg] = "Account created"
        redirect_to sessions_url
      else
        flash[:notice] = "Signup unsuccessful"
        redirect_to new_user_url
      end
    end
  end

end
