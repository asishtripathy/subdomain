class Admin::CompaniesController < ApplicationController
	def index
		@companies = Company.all
	end
	def new
		@company = Company.new
	end
	def create
		@company = Company.new(params[:company].permit(:name , :domain , :phone))
		if @company.save 
			flash[:notice] = "Company Added"
			redirect_to admin_companies_path
		else
			#binding.pry
			error = @company.errors.messages
			key,value = error.first
			flash[:error] = error.values[0]
			render 'new'
		end
	end
end