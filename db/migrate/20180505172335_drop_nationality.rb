class DropNationality < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :nationality_id
    drop_table :user_nationalities
  end
end
