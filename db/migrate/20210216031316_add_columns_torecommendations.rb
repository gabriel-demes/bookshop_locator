class AddColumnsTorecommendations < ActiveRecord::Migration[6.1]
  def change
    add_column :recommendations, :friendship_id, :integer
    add_column :recommendations, :bookshop_id, :integer
    add_column :recommendations, :message, :text
  end
end
