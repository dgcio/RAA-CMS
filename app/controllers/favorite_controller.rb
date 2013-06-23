class FavoriteController < ApplicationController
  def create
    @topic_id = params[:topic_id]
    @favorite = Favorite.new :user_id => session[:user][:id], :topic_id => @topic_id
    @subscribed = Favorite.subscribed(session[:user][:id], @topic_id)

    if !@subscribed and @favorite.save
      redirect_to topics_view_path(@topic_id)
    else
      redirect_to topics_view_path(@topic_id), :subscribed => "You've already subscribed to this topic."
    end
  end

  def delete
    @topic_id = params[:topic_id]
    @favorite = Favorite.where(:topic_id => @topic_id, :user_id => session[:user][:id])
    @favorite.each do |t|
      t.destroy
    end
    redirect_to topics_view_path(@topic_id)
  end
end
