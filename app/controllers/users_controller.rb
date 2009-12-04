class UsersController < ApplicationController

  skip_before_filter :authentication_required, :only => [ :index, :new, :create ]
  
  def index
    @user = User.new
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find params[:id]
  end
  
  def create
    @user = User.new params[:user]
    
    if @user.save
      flash[:msg] = t :account_created
      redirect_to login_url
    else
      flash[:notice] = t :account_not_created
      render :action => "new"
    end
  end
  
  def update
    @user = User.find params[:id]
    
    if @user.update_attributes(params[:user])
      flash[:msg] = t :account_updated
      redirect_to root_url
    else
      flash[:notice] = t :update_unsuccessful
      render :action => 'edit'
    end
  end
  
  def destroy
    user_to_destroy = current_user
    log_user_out!
    user_to_destroy.destroy
    redirect_to login_url
  end

end
