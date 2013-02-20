module TopicsHelper

	def show_form_value(value)
		if value.empty? 
			return ""
		else
			return params[:topic][value]
		end	
	end

end
