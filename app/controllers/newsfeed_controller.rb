class NewsfeedController < ApplicationController
  
  skip_before_filter :authorization_required
  def show
    later = nil
    begin
      later = DateTime.parse(params[:later_than])
    rescue
      # :(
    end
    @newsfeeds = Newsfeed.later_than(later)
    
    respond_to do |format|
      format.json { render :json => @newsfeeds.to_json }
    end
  end
  
end
