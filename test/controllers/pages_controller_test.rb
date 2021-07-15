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

  test "should show private policy page" do
    get "/privacy-policy"
    assert_select "h1", "Política de Privacidade"
  end

  test "should show about page" do
    get "/about"
    assert_select "h1", "Quem somos"
  end

  test "should show leaders page" do
    get "/leaders"
    assert_select "h1", "Alinhe-se ao que faz sentido para si"
  end

  test "should show companies page" do
    get "/companies"
    assert_select "h1", "Cuide dos que cuidam dos seus clientes"
  end
end
