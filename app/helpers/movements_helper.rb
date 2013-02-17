module MovementsHelper

	def show_form_value(value)
		if value.empty? 
			return ""
		else
			return params[:movement][value]
		end	
	end

end
