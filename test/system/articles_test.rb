require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  # test "viewing the index" do
  #   visit articles_path
  #   assert_selector "h1", text: "Inspire-se"
  # end

  test "lets a signed in user with admin privileges create a new article" do
    login_as users(:george)
    visit "/articles/new"
    # save_and_open_screenshot
    fill_in "article_title", with: "Conheça a The Lighthouse"
    find(".trix-content").set("Nosso propósito é te inspirar.")
    check 'carreira'
    click_on 'Criar Artigo'

    # Should be redirected to Home with new product
    assert_equal article_path(title_param: "conheca-a-the-lighthouse"), page.current_path
    assert_text "Nosso propósito é te inspirar."
    # save_and_open_screenshot
  end
end
