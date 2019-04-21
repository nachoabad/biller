require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  test "tax" do
    assert_equal 3.597, line_items(:due_one).tax
    assert_equal 0, line_items(:due_three).tax
    assert_equal 20.691, line_items(:currently_overdue_two).tax
    assert_equal 0, line_items(:currently_overdue_four).tax
    assert_equal 2.398, line_items(:paid_overdue_one).tax
    assert_equal 0, line_items(:paid_overdue_three).tax
    assert_equal 13.794, line_items(:paid_ontime_two).tax
    assert_equal 0, line_items(:paid_ontime_four).tax
  end
end
