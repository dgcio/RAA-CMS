class TopicsController < ApplicationController
  def index
    @topics = Topic.all :limit => 15
  end

  def add
    @topics = Topic.new
  end

  def create
    @topics = Topic.new(params[:topic])

    if request.post?
      @topics.user_id = session[:user][:id]
      if @topics.save 
        redirect_to topics_view_path(@topics.id)
        flash[:notice] = "Succesfully created Topic"
      else
        render :action => "add"
      end
    end
  end

  def edit
    @topics = Topic.find(params[:id])
  end

  def update
    @topics = Topic.find(params[:id])

    if request.post?
      if @topics.update_attributes(params[:topics])
        redirect_to topics_view_path(params[:id])
        flash[:notice] = "Topic succesfully updated."
      else
        render :action => :edit
      end
    end
  end

  def delete
    @topics = Topic.find(params[:id])
    @favorites = Favorite.where(:topic_id => @topics.id)
    @issues = Issue.where(:topic_id => params[:id])
    if @topics.destroy
      @favorites.each { |f| f.destroy }
      @issues.each do |i|
        i.destroy
        @comments = Comment.where(:issue_id => i.id)
        @comments.each do |c|
          c.destroy
        end
      end
      redirect_to topics_path
      flash[:notice] = "Topic ##{params[:id]} succesfully deleted."
    end
  end

  def view
    @topics = Topic.find(params[:id])
    return nil if @topics.blank?
    @users = User.find(@topics.user_id)
    logger.debug @users.name
    @subscribed = Favorite.subscribed(session[:user][:id], @topics.id)
    logger.debug @subscribed
  end
end
