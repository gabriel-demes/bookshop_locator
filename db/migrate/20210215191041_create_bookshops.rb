class CreateBookshops < ActiveRecord::Migration[6.1]
  def change
    create_table :bookshops do |t|

      t.timestamps
    end
  end
end
