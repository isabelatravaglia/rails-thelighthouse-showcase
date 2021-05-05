require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  # called before every single test
  setup do
    @article = articles(:article_1)
  end

  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

  test "should get index" do
    get articles_index_url
    assert_response :success, @response.body
  end
  
  test "should show article" do
    # Reuse the @article instance variable from setup
    get article_url(title_param: "this-is-a-test-article")
    assert_response :success, @response.body
  end

  test "article owner should destroy article" do
    login_as users(:george)
    assert_difference("Article.count", -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_path
  end

  test "user that isn't the article owner should not be able to destroy article" do
    login_as users(:maria)
    assert_difference("Article.count", 0) do
      delete article_url(@article)
    end
  end

  test "article owner should update article" do
    login_as users(:george)
    patch article_url(@article), params: { article: { title: "updated", title_param: "updated" } }
    # Reload association to fetch updated data and assert that title is updated.
    @article.reload
    assert_redirected_to article_path(title_param: @article.title_param)
    assert_equal "updated", @article.title
  end

  test "user that isn't the article owner should not be able to update article" do
    login_as users(:maria)
    patch article_url(@article), params: { article: { title: "updated", title_param: "updated" } }
    assert_equal @response.status, 500
  end

end
