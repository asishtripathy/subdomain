class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
    	t.string :session_id
    	
    end
  end
end
