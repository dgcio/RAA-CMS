class CommentsController < ApplicationController
  def edit
    @comments = Comment.find_by_id(params[:id])
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
    @comments = Comment.find_by_id(params[:id])

    if @comments.update_attributes(params[:comments])
      redirect_to users_profile_path(session[:user][:id])
      flash[:notice] = "Comment succesfully edited."
    else
      render :action => "edit"
    end
  end

  def delete
    @comments = Comment.find_by_id(params[:id]).destroy
    if @comments
      redirect_to request.referer
    end
  end
end
