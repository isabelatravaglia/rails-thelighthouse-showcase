require 'test_helper'

class AudiencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get audiences_index_url
    assert_response :success
  end

end
