class AddCars < ActiveRecord::Migration
  def connection
  	#ActiveRecord::Base.connection.initialize_schema_migrations_table
    ActiveRecord::Base.establish_connection("#{Rails.env}_sec").connection
    #ActiveRecord::Base.connection.initialize_schema_migrations_table
  end
  def up
  	binding.pry
  	create_table :cars do |t|
    	t.references :user
    	t.string :name
    end
    binding.pry
    ActiveRecord::Base.establish_connection("#{Rails.env}").connection
  end

  def down
  	drop_table :cars
  end
end
