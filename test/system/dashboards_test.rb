require "application_system_test_case"

class DashboardsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit dashboard_index_url
  
    assert_selector "h1", text: "Sign in"

    fill_in :email_address, with: users(:one).email_address
    fill_in :password, with: "password"

    click_on "Sign in"
    # page.driver.debug(binding)

    assert_selector "h1", text: "Tramontana Dash ADD APP"
  end
end
