class Admin::ProductsController < ApplicationController
	def index
		#binding.pry
		@products = Product.where(:company_id=>params[:id])
		#binding.pry
	end
	def new
		@product = Product.new
	end
	def create
		
	end
end