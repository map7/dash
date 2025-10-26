require "application_system_test_case"

class AccessesTest < ApplicationSystemTestCase
  setup do
    @access = accesses(:one)
  end

  test "should update Access" do
    visit dashboard_index_url
    login_user

    click_on "access2"

    fill_in "access_login", with: "admin"
    fill_in "access_password", with: "password"
    select "Basic Auth", from: "access_auto_login"

    click_on "Update Access"

    # assert_text "App was successfully updated"

    assert_selector 'h1', text: 'Tramontana Dash ADD APP'
  end
end
