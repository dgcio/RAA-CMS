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
  end

  def delete
  end

  def view
    @issues = Issue.find_by_id(params[:id])
    @follow = Following.new(:main_id => params[:id])
  end

  def add
    @issues = Issue.new
  end
end
