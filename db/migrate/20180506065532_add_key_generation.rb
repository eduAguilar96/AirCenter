class AddKeyGeneration < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'uuid-ossp'

    change_column :flights, :id, :uuid, default: "uuid_generate_v4()"
    change_column :reservations, :id, :uuid, default: "uuid_generate_v4()"
    change_column :tickets, :id, :uuid, default: "uuid_generate_v4()"
    change_column :users, :id, :uuid, default: "uuid_generate_v4()"
  end
end
