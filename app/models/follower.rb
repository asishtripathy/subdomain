class Follower < ActiveRecord::Base
	establish_connection("#{Rails.env}_sec")

	belongs_to :user
  
end