class CartItemsController < ApplicationController
	def index
		@cart_items = currentcart.cart_items
		respond_to do |format|
			format.js
		end
	end
	def create
		params[:cart_item].permit(:product_id, :quantity)
		@cart = currentcart
		#binding.pry
		cart_item = @cart.cart_items.where(:product_id => params['cart_item']['product_id']).first
		#binding.pry
		unless cart_item.nil?
			cart_item.quantity = cart_item.quantity + 1
			cart_item.save
		else
		  @cart.cart_items.create(:product_id=>params['cart_item']['product_id'],:quantity=>1)
		end
		#redirect_to root_path
		respond_to do |format|
			format.js
		end
	end
	def show
		
		#binding.pry
	end
end