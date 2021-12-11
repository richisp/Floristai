class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :flowers, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  has_secure_password
end
