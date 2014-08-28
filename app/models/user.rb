class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_one :role
  accepts_nested_attributes_for :role
  has_many :company_users
  has_many :companies , :through => :company_users
  accepts_nested_attributes_for :company_users, :allow_destroy => true
  has_many :addresses

  has_many :pictures , :as => :imagable
  #has_many :user_products
  #has_many :products, :through => :user_products
  has_and_belongs_to_many :products, join_table: 'user_products'

  has_one :user_facebook_token
  has_one :user_twitter_token

  has_many :followers
  
  def user_role
  	unless self.role.nil?
  		self.role.role
  	end
  end
end
