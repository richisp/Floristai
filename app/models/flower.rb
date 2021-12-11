class Flower < ApplicationRecord
  has_many_attached :images

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :title, presence: true

  def self.search(query)
    if query.present?
      flowers = find_by(title: query)

      if flowers
        where(title: query)
      else
        []
      end
    else
      all
    end
  end
end
