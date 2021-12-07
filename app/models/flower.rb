class Flower < ApplicationRecord
  has_many_attached :images

  belongs_to :user
  has_many :comments
  has_many :order_flowers

  validates :title, presence: true
end
