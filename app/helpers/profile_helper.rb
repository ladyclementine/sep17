module ProfileHelper
	def render_package
		if current_user.is_there_package?
			render :partial => 'profile/my_package_button' 
		else
			render :partial => 'profile/my_package' 
		end
	end		
end
