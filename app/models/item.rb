class Item < ApplicationRecord
  has_many   :line_items, dependent: :destroy

  validates :name, :type, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :type, inclusion: { in: %w(Product Service),
                                message: "%{value} is not a valid type" }
end