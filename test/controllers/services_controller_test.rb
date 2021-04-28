require 'test_helper'

class ServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get services_index_url
    assert_response :success
  end

  test "should show services banner on services page" do
    get "/services"
    assert_select "h1", "Serviços inspiradores"
  end

  test "should show services cards on services page" do
    get "/services"
    assert_select ".service-card", count: Service.count
  end

  test "should show services cards on leaders page" do
    get "/leaders"
    assert_select ".service-card", count: Service.joins(:audiences).where(audiences: {audience_type: "pessoa"}).count
  end

  test "should show services cards on companies page" do
    get "/companies"
    assert_select ".service-card", count: Service.joins(:audiences).where(audiences: {audience_type: "empresa"}).count
  end

end
