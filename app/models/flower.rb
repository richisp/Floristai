class Flower < ApplicationRecord
  has_many_attached :images

  belongs_to :user
  has_many :comments
  validates :images, presence: true
  validates :title, presence:true
end
