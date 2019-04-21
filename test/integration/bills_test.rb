require 'test_helper'
 
class BillsTest < ActionDispatch::IntegrationTest
  setup do
    @bill = bills(:due)
  end
  
  test "can see all bill informations" do
    get bill_url(@bill)
    assert_response :success
    
    assert_match 'Client1', @response.body
    assert_match  'Payment pending', @response.body
    assert_select 'table' do
      assert_select 'tr:nth-child(1)' do
        assert_select 'td:nth-child(1)', '1'
        assert_select 'td:nth-child(2)', 'Product1'
        assert_select 'td:nth-child(3)', 'Product'
        assert_select 'td:nth-child(4)', '11.99'
        assert_select 'td:nth-child(5)', '11.99'
        assert_select 'td:nth-child(6)', '3.597'
        assert_select 'td:nth-child(7)', '15.587'
      end
      assert_select 'tr:nth-child(2)' do
        assert_select 'td:nth-child(1)', '2'
        assert_select 'td:nth-child(2)', 'Service3'
        assert_select 'td:nth-child(3)', 'Service'
        assert_select 'td:nth-child(4)', '11.99'
        assert_select 'td:nth-child(5)', '23.98'
        assert_select 'td:nth-child(6)', '0'
        assert_select 'td:nth-child(7)', '23.98'
      end
      assert_select 'tr:nth-child(3)' do
        assert_select 'td:nth-child(2)', 'Additional Charges'
        assert_select 'td:nth-child(3)', '0'
      end
      assert_select 'tr:nth-child(4)' do
        assert_select 'td:nth-child(2)', 'Total'
        assert_select 'td:nth-child(3)', '39.567'
      end
    end
  end
end