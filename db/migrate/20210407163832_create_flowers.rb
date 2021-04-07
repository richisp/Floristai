class CreateFlowers < ActiveRecord::Migration[6.1]
  def change
    create_table :flowers do |t|
      t.string :title
      t.text :description
      t.string :flowering_time

      t.timestamps
    end
  end
end
