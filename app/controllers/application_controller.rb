# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  include UserAuthentication # /lib/user_authentication.rb
  require 'RedCloth'
  
  before_filter :authentication_required
  before_filter :set_locale
  
  protected
  
  def authentication_required
    if logged_in?
      return true
    else
      redirect_to login_url
    end
  end
  
  private
  
  def set_locale
    session[:locale] = params[:locale] if params[:locale]
    I18n.locale = session[:locale]
  end
  
end
