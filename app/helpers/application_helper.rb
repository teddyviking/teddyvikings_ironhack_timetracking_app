module ApplicationHelper
	def flash_message
		if flash[:notice]
			flash[:notice]
		end
		if flash[:alert]
			flash[:alert]
		end
	end
end
