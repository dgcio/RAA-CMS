class IssuesController < ApplicationController
  def index
    @issues = Issue.all :limit => 10
  end

  def create
    @issues = Issue.new(params[:issue])

    if request.post?
      @issues.user_id = session[:user][:id]
      @issues.movement_id = params[:movement_id]
      if @issues.save
        redirect_to movements_view_path(params[:movement_id])
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
    @issues = Issue.find_by_id(params[:id]).destroy
    @comments = Comment.find_all_by_issue_id(params[:id])
    if @issues
      @comments.each do |c|
        c.destroy
      end
      redirect_to issues_path
      flash[:notice] = "issue ##{params[:id]} succesfully deleted."
    end
  end

  def view
    @issues = Issue.find_by_id(params[:id])
    return nil if @issues.blank?
    @users = User.joins(:issues).where(:id => @issues.user_id).limit 1
    @show_comments = @issues.comments.all
  end

  def add
    @issues = Issue.new
  end
end
