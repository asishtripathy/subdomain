class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string :variation
      t.string :value
      t.references :product
      t.timestamps
    end
  end
end
