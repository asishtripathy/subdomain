class CreateFollowers < ActiveRecord::Migration
  def connection
  	#ActiveRecord::Base.connection.initialize_schema_migrations_table
    ActiveRecord::Base.establish_connection("#{Rails.env}_sec").connection
    #ActiveRecord::Base.connection.initialize_schema_migrations_table
  end
  def change
    create_table :followers do |t|
    	t.references :user
    	t.string :name
    end
    ActiveRecord::Base.establish_connection("#{Rails.env}").connection
  
  end
end
