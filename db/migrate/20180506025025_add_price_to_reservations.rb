class AddPriceToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservation_informations, :price, :integer, null: false, default: 1000
    add_column :reservation_informations, :seat, :string
  end
end
