class CommentsController < ApplicationController
  def edit
    @comments = Comment.find_by_id(params[:id])
  end

  def create
    @comments = Comment.new(:user_id => session[:user][:id], 
                            :issue_id => params[:issue_id], 
                            :author => session[:user][:email], 
                            :body => params[:comment][:body])
    if @comments.save
      redirect_to request.referer
      flash[:notice] = "Comment succesfully added"
    else
      redirect_to request.referer
      flash[:notice] = "Comment is too short. Needs to be longer than 10 characters."
    end
  end

  def update
    @comments = Comment.find_by_id(params[:id])

      if @comments.update_attributes(params[:comments])
        redirect_to issues_view_path(@comments.issue_id)
        flash[:notice] = "Comment succesfully edited."
      else
        render :action => "edit"
      end
  end

  def delete
    @issue_id = Comment.find(params[:id]).issue_id
    @comments = Comment.find_by_id(params[:id]).destroy
    if @comments
      redirect_to issues_view_path(@issue_id)
    end
  end
end
