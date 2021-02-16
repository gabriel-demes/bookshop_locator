class AddFrienderColumnsToFriendships < ActiveRecord::Migration[6.1]
  def change
    add_column :friendships, :friender_id, :integer
    add_column :friendships, :friendee_id, :integer
  end
end
