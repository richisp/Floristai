class AddUserIdToFlowers < ActiveRecord::Migration[6.1]
  def change
    add_column :flowers, :user_id, :integer
    add_index :flowers, :user_id
  end
end
