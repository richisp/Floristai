class AddGoogleSecretToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :google_secret, :string
  end
end
