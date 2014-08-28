class Picture < ActiveRecord::Base
	belongs_to :imagable , :polymorphic => true
end