class Bill < ApplicationRecord
  OVERDUE_DAILY_CHARGE = 5

  belongs_to :client
  has_many   :line_items, dependent: :destroy

  validates :due_date, presence: true

  def total
    line_items.sum(&:total) + additional_charges
  end

  def additional_charges
    days_past_due * OVERDUE_DAILY_CHARGE
  end

  private

  def days_past_due
    if currently_overdue?
      (Date.current - due_date).to_i
    elsif paid_overdue?
      (paid_date - due_date).to_i
    else
      0
    end
  end

  def paid_overdue?
    paid? && (paid_date > due_date)
  end

  def currently_overdue?
    !paid? && (Date.current > due_date)
  end

  def paid?
    paid_date.present?
  end
end