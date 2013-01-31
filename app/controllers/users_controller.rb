class UsersController < ApplicationController
  def index
  end

  def profile
    @users = User.find_by_id(params[:id])
    @comments = @users.comments.all :limit => 5
    @movements = @users.movements.all
    @issues = @users.issues.all
    @follow_issue = User.issue_followings(params[:id])
    @follow_movement = User.movement_followings(params[:id])
  end

  def register
    @users = User.new
  end

  def login
    return nil if params[:user].blank?
    @users = params[:user]

    if request.post?
      @users = User.authenticate(params[:user][:email], params[:user][:password])
      if @users
        session[:user] = @users
        redirect_to users_profile_path(@users.id)
        flash[:notice] = "Succesfully Logged in."
      else
        redirect_to users_login_path
        flash[:notice] = "Email/Password incorrect. Please try again."
      end
    end
  end

  def create
    @users = User.new(params[:user])

    if @users.save
      redirect_to users_login_path
      flash[:notice] = "Succesfully created account #{@users.email}, you can now login."
    else
      render :action => 'register'
    end
  end

  def logout
    return nil if session[:user].blank?
    session[:user] = nil
    redirect_to root_path
    flash[:notice] = "Succesfully logged out."
  end

  def delete
  end
end
