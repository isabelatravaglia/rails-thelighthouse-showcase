require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should show main home page banner" do
    get "/"
    assert_select "h1", "Oriente-se para o que te traz sentido"
  end

  test "should show secondary home page banner" do
    get "/"
    assert_select "h2", "Alinhe-se à sua verdade!"
  end

  test "should show services cards on home page" do
    get "/"
    assert_select ".grid-service-card", count: Service.where(hp_show: true).count
  end

  test "should show testimonials on home page" do
    get "/"
    assert_select "h2", "Depoimentos"
  end
end
