class CreateCompanyUsers < ActiveRecord::Migration
  def change
    create_table :company_users do |t|
      t.references :company
      t.references :user
      t.timestamps
    end
  end
end
