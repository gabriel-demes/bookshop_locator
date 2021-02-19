class AddImgRatingToBookshops < ActiveRecord::Migration[6.1]
  def change
    add_column :bookshops, :img_rating, :string
  end
end
