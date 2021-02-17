class AddDateToVisits < ActiveRecord::Migration[6.1]
  def change
    add_column :visits, :date, :string
  end
end
