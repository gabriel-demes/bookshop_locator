class AddAttributesToVisits < ActiveRecord::Migration[6.1]
  def change
    add_column :visits, :favorite, :boolean
    add_column :visits, :user_id, :integer
    add_column :visits, :book_shop_id, :integer
  end
end
