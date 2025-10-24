require "test_helper"

class LoginFlowTest < ActionDispatch::IntegrationTest
  test "logs in and is presented with the dashboard" do
    get "/session/new"
    assert_dom "h1", "Sign in"

    # post the login and follow through to the home page
    post session_path, params: { email_address: users(:one).email_address,
                                password: "password" }

    follow_redirect!
    assert_equal 200, status
    assert_equal "/", path
    # assert_dom "h1", "Tramontana Dash"
  end
end
