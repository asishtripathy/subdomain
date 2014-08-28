class UserTwitterToken < ActiveRecord::Base
	belongs_to :user

	def self.find_or_create(auth)
		token = self.where(:nickname => auth.info.nickname).first
		unless token.nil?
			return token
		else
			token = self.create({:nickname=>auth.info.nickname , :token=>auth.credentials.token , :secret=>auth.credentials.secret , :image=>auth.info.image})
			return token
		end
		#binding.pry
	end
end