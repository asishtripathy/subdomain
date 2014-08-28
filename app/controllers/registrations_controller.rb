class RegistrationsController < Devise::RegistrationsController
	def new
		@user = User.new
	end
	def create
		
		@user = User.new(params[:user].permit(:name, :email, :password))
		#binding.pry
	    if @user.save
	      @user.create_role(:role=>'customer')
	      redirect_to root_path
	    else
	      #code
	      render :new
	    end

	end
	def completion
		#binding.pry
		@user_token = UserTwitterToken.where(:id => params[:id]).first
		@user = @user_token.build_user
	end
	def complete_signup
		binding.pry
		@user = User.new(params[:user].permit(:name, :email))
		@user.password = Devise.friendly_token[0,20]
		@user.save!
		@user_token = UserTwitterToken.where(:id => params[:user_twitter_token][:id]).first
		if @user_token.user != @user
			@user_token.user = @user
			@user_token.save!
		end
		sign_in(@user)
		redirect_to root_path
	end
end
