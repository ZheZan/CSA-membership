require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:  "Example User",
                                            uin: "11111111",
                                            password:              "password",
                                            password_confirmation: "password" }
    end
    assert_template 'users/show'
    assert is_logged_in?
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, session: { uin: @user.uin, password: 'password' }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
end
