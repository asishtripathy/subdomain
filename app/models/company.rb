class Company < ActiveRecord::Base
	#attr_accessible :name, :domain, :phone
	has_many :products
	has_many :users , :through => :company_users
	validates :name, :presence => {:message => "Company Name can not be blank !"}
	validates :domain , :presence => {:message => "Give a domain name"} , uniqueness: true
end
