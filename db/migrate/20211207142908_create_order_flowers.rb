class CreateOrderFlowers < ActiveRecord::Migration[6.1]
  def change
    create_table :order_flowers do |t|
      t.integer :quantity, null: false
      t.string :status, null: false, default: 'pending'
      t.references :order, null: false, foreign_key: true
      t.references :flower, null: false, foreign_key: true

      t.timestamps
    end
  end
end
