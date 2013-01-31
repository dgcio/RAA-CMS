class CommentsController < ApplicationController
  def edit
  end

  def create
    @comments = Comment.new(:user_id => session[:user][:id], :body => params[:comments][:body], :author => session[:user][:email])
    @referer = request.referer.split "/"

    if @referer[3] == "movements"
      @comments.movement_id = @referer[4]
      @comments.issue_id = 0
    else
      @comments.issue_id = @referer[4]
      @comments.movement_id = 0
    end

    if request.post?
      if @comments.save
        redirect_to request.referer
        flash[:notice] = "Comment succesfully added"
      else
        redirect_to request.referer
        flash[:notice] = "Something went wrong"
      end
    end
  end

  def update
  end

  def delete
  end
end
