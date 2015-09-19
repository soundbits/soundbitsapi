class FeedController < ApplicationController
  def feed
    user = User.find(params[:id])

    respond_to do |format|
      format.rss { render :layout => false }
    end
    
  end
end
