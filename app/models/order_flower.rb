class OrderFlower < ApplicationRecord
  belongs_to :order
  belongs_to :flower
end
