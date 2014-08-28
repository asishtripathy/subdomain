class SessionsController < Devise::SessionsController
	def new
		@user = User.new
	end
	def create
		@user = warden.authenticate!(params[:user])
	    set_flash_message(:notice, :signed_in) if is_flashing_format?
	    sign_in @user
	    #binding.pry
	    role = @user.role.role
	   	if role == 'customer'
	   		redirect_to root_path
	   	else	   		
	   		redirect_to admin_companies_path
	   	end
	    #respond_with resource, location: after_sign_in_path_for(resource)
	end
end