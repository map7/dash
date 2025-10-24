require "test_helper"

class LoginFlowTest < ActionDispatch::IntegrationTest
  test "logs in and is presented with the dashboard" do
    login
    assert_equal "/", path
    assert_dom "h1", "Tramontana Dash ADD APP"
  end
end
