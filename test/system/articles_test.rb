require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  test "viewing the index" do
    visit articles_path
    assert_selector "h1", text: "Inspire-se"
  end

  test "lets a signed in user with admin privileges create a new article" do
    login_as users(:george)
    visit "/articles/new"
    fill_in "article_title", with: "Conheça a The Lighthouse"
    find(".trix-content").set("Nosso propósito é te inspirar.")
    check 'carreira'
    click_on 'Criar Artigo'

    # Should be redirected to Home with new product
    assert_equal article_path(title_param: "conheca-a-the-lighthouse"), page.current_path
    assert_text "Nosso propósito é te inspirar."
    # save_and_open_screenshot
  end

  test "doesnt let signed in users without admin privileges to create an article" do
    login_as users(:maria)
    visit "/articles/new"
    assert_text "Pundit::NotAuthorizedError"
    # save_and_open_screenshot
  end

  test "doesnt let unsigned users to create an article" do
    visit "/articles/new"
    assert_text "You need to sign in or sign up before continuing"
  end
end
