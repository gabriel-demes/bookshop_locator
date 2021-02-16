class AddAttributesToBookshops < ActiveRecord::Migration[6.1]
  def change
    add_column :bookshops, :name, :string
    add_column :bookshops, :address, :string
    add_column :bookshops, :zipcode, :integer
    add_column :bookshops, :phone_number, :string
  end
end
