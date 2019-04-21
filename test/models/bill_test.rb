require 'test_helper'

class BillTest < ActiveSupport::TestCase
  test "additional_charges" do
    assert_equal 0, bills(:due).additional_charges
    assert_equal 5, bills(:currently_overdue).additional_charges
    assert_equal 5, bills(:paid_overdue).additional_charges
    assert_equal 0, bills(:paid_ontime).additional_charges
  end
  
  test "total" do
    assert_equal 39.567, bills(:due).total
    assert_equal 186.621, bills(:currently_overdue).total
    assert_equal 43.368, bills(:paid_overdue).total
    assert_equal 174.724, bills(:paid_ontime).total
  end
end
