class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
    	t.references :cart
    	t.references :product
    	t.integer :quantity
    end
  end
end
