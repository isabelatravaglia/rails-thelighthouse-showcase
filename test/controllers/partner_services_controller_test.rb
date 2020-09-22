require 'test_helper'

class PartnerServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get partner_services_index_url
    assert_response :success
  end

end
