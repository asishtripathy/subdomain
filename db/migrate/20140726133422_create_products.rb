class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price ,:precision => 5, :scale => 2, :default => 0.00
      t.references :company
      t.timestamps
    end
  end
end
