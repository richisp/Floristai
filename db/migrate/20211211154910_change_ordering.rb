class ChangeOrdering < ActiveRecord::Migration[6.1]
  def change
    drop_table :order_flowers

    add_column :orders, :quantity, :integer
    add_column :orders, :status, :string
    add_reference :orders, :flower, foreign_key: true
  end
end
