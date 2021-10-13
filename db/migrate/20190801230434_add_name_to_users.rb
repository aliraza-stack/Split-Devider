class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :date_of_birth,:datetime	
    add_column :users, :city, :string			
  end
end
