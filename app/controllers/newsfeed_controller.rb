class NewsfeedController < ApplicationController
  
  skip_before_filter :authorization_required
  
  def index
    @newsfeeds = Newsfeed.all
    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
  end
  
  def show
    if not params[:later_than]
      params[:later_than] = "20.minutes.ago"
    end
    later = nil
    begin
      later = DateTime.parse(params[:later_than])
    rescue
      # :(
    end
    @newsfeeds = Newsfeed.later_than(later)
    
    respond_to do |format|
      format.rss
      format.json { render :json => @newsfeeds.to_json }
    end
  end
  
end
