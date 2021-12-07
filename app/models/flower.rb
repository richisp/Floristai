class Flower < ApplicationRecord
  has_many_attached :images

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :order_flowers, dependent: :destroy

  validates :title, presence: true
end
