class UsersController < ApplicationController
  protect_from_forgery :except => [:create, :reject_episode, :add_episode]
  def feed
    @user = User.find(params[:id])
    @episodes = @user.episodes.all
    @pubDate  = @episodes.first ? @episodes.first.created_at : DateTime.now
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.json{render json: @user.to_json(:methods => :suggestions, :include=> :episodes )}
    end
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]

    @user = User.create(first_name: first_name, last_name: last_name)
    respond_to do |format|
      format.json { render json: @user.to_json}
      format.html { }
    end
  end

  def add_episode
    @user    = User.find(params["id"])
    @episode = Episode.find(params["episode_id"])
    @user.episodes << @episode unless @user.episodes.pluck(:id).include? @episode.id

    respond_to do |format|
      format.json { render json: @user.to_json}
    end
  end

  def reject_episode
    @user    = User.find(params["id"])
    @episode = Episode.find(params["episode_id"])

    @user.rejections << @episode unless @user.rejections.pluck(:id).include? @episode.id
    respond_to do |format|
      format.json { render json: @user.to_json}
    end
  end

  def suggestions
    @user = User.find(params["id"])
    rejection_list = @user.rejections.pluck(:episode_id)

    @episodes = Episode.random_sample(10).where("id NOT IN (?)", rejection_list).all
    respond_to do |format|
      format.json {render json: @episodes}
    end
  end

end
