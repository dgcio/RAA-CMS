class UsersController < ApplicationController
  def index
    redirect_to root_path
  end

  def profile
    @users = User.find(params[:id])
    @favorites = Favorite.where(:user_id => @users.id).map(&:topic_id)
    @topics = Topic.find(@favorites)
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

    if request.post? && @users.save
      redirect_to users_login_path, :flash =>  { :success => "Successfully created account for " + @users.email + ", you can now login." }
    else
      render :action => 'register'
    end
  end

  def logout
    return nil if session[:user].blank?
    session[:user] = nil
    redirect_to root_path, :flash => { :logout => "You've succesfully logged out." }
  end

  def delete
  end
end
