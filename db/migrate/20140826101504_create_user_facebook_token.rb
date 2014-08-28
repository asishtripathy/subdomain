class CreateUserFacebookToken < ActiveRecord::Migration
  def change
    create_table :user_facebook_tokens do |t|
    	t.references :user
    	t.string :access_token
    	t.string :email
    	t.string :uid
    	t.string :religion
    	t.string :political
    end
  end
end
