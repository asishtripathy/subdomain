class Admin::UsersController < ApplicationController
	def index
		@users = User.all
	end
	def new
		@user = User.new
		@companies = Company.all
	end
	def create
		@user = User.new(params[:user].permit(:name, :email, :password,
						:role_attributes =>[:role],
						:company_users_attributes =>[:company_id]))
		#binding.pry
	    if @user.save
	      #@user.create_role(:role=>'customer')
	      redirect_to admin_users_path
	    else
	      #code
	      render :new
	    end
	end
end