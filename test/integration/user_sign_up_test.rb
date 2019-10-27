require 'test_helper'

class UserSignUpTest < ActionDispatch::IntegrationTest
  
  test "User create an account" do
    get new_user_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post users_path, user: { username: "test22", email: "test@gmail.com", password: "blahblah" }
      #follow_redirect!
  end
  assert_template 'users_path'
  assert_match "test22", response.body
  end
end
