class AddUserIdToGroupsAndEntries < ActiveRecord::Migration[5.2]
  def change
  	add_column :groups,  :user_id, :integer
  	add_column :entries, :user_id, :integer
  	add_column :entries, :group_id,:integer
  end
end
