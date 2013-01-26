class FollowingsController < ApplicationController 
	def follow_issue
		@follow_invalid = Following.find_all_by_main_id_and_user_id_main_type(params[:id], session[:user][:id], "issue")
		@follow = Following.new(:main_id => params[:id], :user_id => session[:user][:id], :main_type => "issue")
		
		if request.post?
			if @follow_invalid.blank? && @follow.save 
				flash[:notice] = "Succesfully started following Issue"
				redirect_to issues_path
			else
				flash[:notice] = "Either you're already following this Movement or something went from."
				redirect_to issues_path
			end
		end
	end

	def follow_movement
		@follow_invalid = Following.find_all_by_main_id_and_user_id_and_main_type(params[:id], session[:user][:id], "movement")
		@follow = Following.new(:main_id => params[:id], :user_id => session[:user][:id], :main_type => "movement")
		
		if request.post?
			if @follow_invalid.empty? && @follow.save 
				flash[:notice] = "Succesfully started following Movement"
				redirect_to movements_path
			else
				flash[:notice] = "Either you're already following this Movement or something went from."
				redirect_to movements_path
			end
		end
	end
end
