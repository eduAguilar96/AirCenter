class LinkReservationToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :reservation_informations, :user_id, :uuid
  end
end
