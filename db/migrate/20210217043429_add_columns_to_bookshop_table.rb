class AddColumnsToBookshopTable < ActiveRecord::Migration[6.1]
  def change
    add_column :bookshops, :image, :string
    add_column :bookshops, :rating, :float
  end
end
