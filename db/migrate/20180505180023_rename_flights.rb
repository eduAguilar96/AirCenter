class RenameFlights < ActiveRecord::Migration[5.1]
  def change
    rename_table :flight_informations, :flights
  end
end
