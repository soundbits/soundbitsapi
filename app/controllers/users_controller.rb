class UsersController < ApplicationController
  def feed
    @user = User.find(params[:id])
    @episodes = @user.episodes.all
    @pubDate  = @episodes.first ? @episodes.first.created_at : DateTime.now
    respond_to do |format|
      format.rss { render :layout => false }
    end

  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    @user = User.create(first_name: first_name, last_name: last_name)
    respond_to do |format|
      format.json { render json: @user.to_json}
    end
  end

  def add_episode
    @user    = User.find(params[:id])
    @episode = User.find(params[:episode_id])
    @user << @episode
    respond_to do |format|
      format.json { render json: @user.to_json}
    end
  end

  def suggestions
    @episodes = Episode.all.sample(20)
    respond_to do |format|
      format.json {render json: @episodes}
    end
  end

end
