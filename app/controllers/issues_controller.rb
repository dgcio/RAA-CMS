class IssuesController < ApplicationController
  def index
    @issues = Issue.all :limit => 10
  end

  def create
    @issues = Issue.new(params[:issue])

    if request.post?
      @issues.user_id = session[:user][:id]
      @issues.movement_id = 0
      if @issues.save
        redirect_to issues_path
      else
        render :action => "add"
      end
    end
  end

  def edit
    @issues = Issue.find_by_id(params[:id])
  end

  def update
    @issues = Issue.find_by_id(params[:id])

    if request.post?
      if @issues.update_attributes(params[:issues])
        redirect_to issues_view_path(params[:id])
      else
        render :action => :edit
      end
    end
  end

  def delete
    @issues = Issue.find_by_id(params[:id])
    @issues.destroy
  end

  def view
    @issues = Issue.find_by_id(params[:id])
    @users = User.joins(:issues).where(:id => @issues.user_id).limit 1
    @follow = Following.new(:issue_id => params[:id])
    @show_comments = Comment.find_all_by_issue_id(params[:id])
  end

  def add
    @issues = Issue.new
  end
end
