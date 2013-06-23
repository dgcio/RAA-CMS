class IssuesController < ApplicationController
  def index
    @issues = Issue.all :limit => 10
  end

  def create
    @issues = Issue.new(params[:issue])

    if request.post?
      @issues.user_id = session[:user][:id]
      @issues.topic_id = params[:topic_id]
      if @issues.save
        redirect_to topics_view_path(params[:topic_id])
      else
        render :action => "add"
      end
    end
  end

  def edit
    @issues = Issue.find(params[:id])
  end

  def update
    @issues = Issue.find(params[:id])

    if request.post?
      if @issues.update_attributes(params[:issues])
        redirect_to issues_view_path(params[:id])
      else
        render :action => :edit
      end
    end
  end

  def delete
    @issues = Issue.find(params[:id])
    @topic_id = @issues.topic_id
    @comments = Comment.find_all_by_issue_id(params[:id])
    if @issues.destroy
      @comments.each do |c|
        c.destroy
      end
      redirect_to topics_view_path(@topic_id), :notice => "Issue ##{params[:id]} succesfully deleted."
    end
  end

  def view
    @issues = Issue.find(params[:id])
    return nil if @issues.blank?
    @users = User.find(@issues.user_id)
    @comments = @issues.comments.all
  end

  def add
    @issues = Issue.new
  end
end
