class Client < ApplicationRecord
  has_many :bills, dependent: :destroy

  validates :name, :postal_code, presence: true
  validates :postal_code, format: { with: /\A[+-]?\d+\z/,
                                    message: "%{value} is not a valid postal code" }
end