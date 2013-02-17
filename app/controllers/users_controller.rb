class UsersController < ApplicationController
  def index
    redirect_to root_path
  end

  def profile
    @users = User.find_by_id(params[:id])
    @movements = @users.movements.all :limit => 5
    @issues = @users.issues.all :limit => 5
    @comments = @users.comments.all :limit => 5
  end

  def register
    @users = User.new
  end

  def login
    @users = params[:user]
    return nil if @users.blank?
    
    if request.post?
      @users = User.authenticate(params[:user][:email], params[:user][:password])
      if session[:user] = @users
        redirect_to users_profile_path(@users.id), :notice => "Successfully Logged in."
      else
        redirect_to users_login_path, :notice => "Email/Password incorrect. Please try again."
      end
    end
  end

  def create
    @users = User.new(params[:user])

    if request.post?
      if @users.save
        redirect_to users_login_path, :notice => "Successfully created account for " + @users.email + ", you can now login."
      else
        render :action => 'register'
      end
    end
  end

  def logout
    return nil if session[:user].blank?
    session[:user] = nil
    redirect_to root_path, :notice => "Successfully logged out."
  end

  def delete
  end
end
