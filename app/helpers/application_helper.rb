module ApplicationHelper

	def is_logged_in?
		return session[:user]
	end

	def auth_required
		not is_logged_in?
	end

	def show_msg(msg, type)
		return content_tag :div, msg.html_safe, :class => "alert alert-#{type}"
	end

	def admin_of_post?(id)
		return session[:user][:id] == id
	end
end
