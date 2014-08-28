class Product < ActiveRecord::Base
	belongs_to :company
	has_many :variants
	has_many :cart_items
	accepts_nested_attributes_for :variants , :allow_destroy => true
	has_many :pictures , :as => :imagable
	#has_many :user_products
	#has_many :users, :through => :user_products
	has_and_belongs_to_many :users

	def self.getProducts(id)
		p = where('id = ?',id).first
		p.inspect
	end
end

