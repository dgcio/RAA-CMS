module UsersHelper

	def is_invalid_user
		return @users.blank?
	end

  def creator(method, link)
    if !is_invalid_user 
      if link
        link_to @users[method].capitalize, users_profile_path(@users.id)
      else
        @users[method].capitalize
      end
    end
  end
  
  def user(method, link)
    if link
      link_to session[:user][method].capitalize, users_profile_path(session[:user][:id])
    else
      session[:user][method].capitalize
    end
  end
end
