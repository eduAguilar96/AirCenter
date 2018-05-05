class DropBag < ActiveRecord::Migration[5.1]
  def change
    drop_table :bags
    add_column :users, :bags, :integer
  end
end
