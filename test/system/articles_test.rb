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
    # attach_file('article_photo', 'app/assets/images/life-coaching.jpg')
    # attach_file('article_photo', Rails.root.join('app','assets','images','life-coaching.jpg'))
    # attach_file('article_photo', File.join(Rails.root,'app/assets/images/life-coaching.jpg'))
    fill_in "article_title", with: "Le Wagon"
    find(".trix-content").set("Change your life: Learn to code")
    check 'carreira'
    
    # find('form input[type="file"]')
    # save_and_open_screenshot

    click_on 'Criar Artigo'
    # save_and_open_screenshot

    # Should be redirected to Home with new product
    # assert_equal article_path, page.current_path
    # assert_text "Change your life: Learn to code"
    # save_and_open_screenshot
  end
end
