require 'test_helper'

class Public::ShippingAddressControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_shipping_address_index_url
    assert_response :success
  end

end
