class AddFlowerToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :flower, null: false, foreign_key: true
  end
end
