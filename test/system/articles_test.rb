require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit articles_url
  #
  #   assert_selector "h1", text: "Articles"
  # end
  test "viewing the index" do
    visit articles_path
    assert_selector "h1", text: "Inspire-se"
  end
end
