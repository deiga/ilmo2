class NewsfeedController < ApplicationController
  
  skip_before_filter :authorization_required, :only => [ :show ]
  
  def show
    @newsfeeds = (params[:amount] ? Newsfeed.recent(params[:amount]) : Newsfeed.recent)
    
    respond_to do |format|
      format.atom
      format.rss
      format.json { render :json => @newsfeeds.to_json }
    end
  end
  
end
