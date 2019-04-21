class LineItem < ApplicationRecord
  include Taxable

  belongs_to :item
  belongs_to :bill

  delegate :name, :type, :price, to: :item

  def sub_total
    item.price * quantity
  end

  def tax
    item.taxable? ? sub_total * tax_rate : 0
  end

  def total
    sub_total + tax
  end

  private

  def tax_rate
    applicable_tax(client.postal_code)
  end

  def client
    bill.client
  end
end