require 'test_helper'

def setup
  @user = User.create(username: "jax", email: "jax@gmail.com", password: "password")
end

class CreateArticlesTest < ActionDispatch::IntegrationTest
  sign_in_as(@user, "password")
  test "get articles form and create article"
    get new_article_path
    assert_template 'articles/new'
    assert_difference, 'Article.count', 1 do
      post article_path 
end