class CreateUserProducts < ActiveRecord::Migration
  def change
    create_table :user_products do |t|
    	t.references :user
    	t.references :product
    end
  end
end
