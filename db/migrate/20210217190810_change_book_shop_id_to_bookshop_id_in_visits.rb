class ChangeBookShopIdToBookshopIdInVisits < ActiveRecord::Migration[6.1]
  def change
    rename_column :visits, :book_shop_id, :bookshop_id
  end
end
