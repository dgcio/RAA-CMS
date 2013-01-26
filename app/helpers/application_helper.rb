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
end
