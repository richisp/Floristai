class Order < ApplicationRecord
  belongs_to :user
  belongs_to :flower

  enum status: {
    pending: 0,
    finished: 1,
    canceled: 2
  }
end
