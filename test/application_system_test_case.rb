require "test_helper"
require "capybara/cuprite"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :cuprite_rails

  def login_user
    assert_selector "h1", text: "Sign in"

    fill_in :email_address, with: users(:one).email_address
    fill_in :password, with: "password"

    click_on "Sign in"
  end
end
