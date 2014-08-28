class ProductsController < ApplicationController
	def index
  	#binding.pry
  	@products = Product.all.where(:company_id => params[:id])
    
  	end
end