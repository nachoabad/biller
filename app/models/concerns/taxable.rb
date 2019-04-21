module Taxable
  extend ActiveSupport::Concern

  def applicable_tax(postal_code)
    case postal_code
    when '1111', '3333', '5555'
      0.30
    when '2222', '4444', '6666'
      0.20
    else
      0
    end
  end
end