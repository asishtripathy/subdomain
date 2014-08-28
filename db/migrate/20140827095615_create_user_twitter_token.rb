class CreateUserTwitterToken < ActiveRecord::Migration
  def change
    create_table :user_twitter_tokens do |t|
    	t.references :user
    	t.string :nickname
    	t.string :token
    	t.string :secret
    	t.string :image
    end
  end
end
