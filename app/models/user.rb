class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :flowers, dependent: :destroy
  has_many :orders, dependent: :destroy
end
