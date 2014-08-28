class OmniauthCallbacksController < Devise::OmniauthCallbacksController 
	def facebook 
		
		auth = env["omniauth.auth"] #User.find_for_oauth(env["omniauth.auth"], current_user)
		#binding.pry
		unless auth.credentials.token.blank? 
			if user_signed_in? 
				current_user.create_user_facebook_token(
				{
				:access_token => auth.credentials.token, 
				:email => auth.info.email, 
				:political => auth.extra.raw_info.political, 
				:religion => auth.extra.raw_info.religion, 
				:uid => auth.uid
				}
				) if current_user.user_facebook_token.blank?
			else
				@user = User.new(:name=>auth.info.first_name, :email=>auth.info.email, :password=>Devise.friendly_token[0,20])
				#@user.skip_confirmation!
				@user.save!
				@user.create_user_facebook_token(
				{
				:access_token => auth.credentials.token, 
				:email => auth.info.email, 
				:political => auth.extra.raw_info.political, 
				:religion => auth.extra.raw_info.religion, 
				:uid => auth.uid
				}
				)
				sign_in(@user)
			end

		else
			flash[:alert] = 'You need to permit the app to access your facebook credential'
		end
		redirect_to root_path
	end

	def twitter 
		
		auth = env["omniauth.auth"] #User.find_for_oauth(env["omniauth.auth"], current_user)
		#binding.pry
		unless auth.credentials.token.blank? 
			if user_signed_in? 
				# current_user.create_user_facebook_token(
				# {
				# :access_token => auth.credentials.token, 
				# :email => auth.info.email, 
				# :political => auth.extra.raw_info.political, 
				# :religion => auth.extra.raw_info.religion, 
				# :uid => auth.uid
				# }
				# ) if current_user.user_facebook_token.blank?
			else
				user_token = UserTwitterToken.find_or_create auth
				session[:twitter] = user_token
				redirect_to completion_path(user_token)
				# @user = User.new(:name=>auth.info.first_name, :email=>auth.info.email, :password=>Devise.friendly_token[0,20])
				# #@user.skip_confirmation!
				# @user.save!
				# @user.create_user_facebook_token(
				# {
				# :access_token => auth.credentials.token, 
				# :email => auth.info.email, 
				# :political => auth.extra.raw_info.political, 
				# :religion => auth.extra.raw_info.religion, 
				# :uid => auth.uid
				# }
				# )
				# sign_in(@user)
			end

		else
			flash[:alert] = 'You need to permit the app to access your facebook credential'
		end
		#redirect_to root_path
	end
	def linkedin 
		
		auth = env["omniauth.auth"] #User.find_for_oauth(env["omniauth.auth"], current_user)
		binding.pry
		# unless auth.credentials.token.blank? 
		# 	if user_signed_in? 
		# 		current_user.create_user_facebook_token(
		# 		{
		# 		:access_token => auth.credentials.token, 
		# 		:email => auth.info.email, 
		# 		:political => auth.extra.raw_info.political, 
		# 		:religion => auth.extra.raw_info.religion, 
		# 		:uid => auth.uid
		# 		}
		# 		) if current_user.user_facebook_token.blank?
		# 	else
		# 		@user = User.new(:name=>auth.info.first_name, :email=>auth.info.email, :password=>Devise.friendly_token[0,20])
		# 		#@user.skip_confirmation!
		# 		@user.save!
		# 		@user.create_user_facebook_token(
		# 		{
		# 		:access_token => auth.credentials.token, 
		# 		:email => auth.info.email, 
		# 		:political => auth.extra.raw_info.political, 
		# 		:religion => auth.extra.raw_info.religion, 
		# 		:uid => auth.uid
		# 		}
		# 		)
		# 		sign_in(@user)
		# 	end

		# else
		# 	flash[:alert] = 'You need to permit the app to access your facebook credential'
		# end
		redirect_to root_path
	end
end
