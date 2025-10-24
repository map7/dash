require "application_system_test_case"

class DashboardsTest < ApplicationSystemTestCase
  test "Login and direct to the first app" do

    visit dashboard_index_url
  
    assert_selector "h1", text: "Sign in"

    fill_in :email_address, with: users(:one).email_address
    fill_in :password, with: "password"

    click_on "Sign in"

    assert_selector "h1", text: "Tramontana Dash ADD APP"
    
    # page.driver.debug(binding)
    click_link(id: '0')         # Google link
  end

  test 'Login and direct to the second app and asks for password' do
    visit dashboard_index_url

    assert_selector 'h1', text: 'Sign in'

    fill_in :email_address, with: users(:one).email_address
    fill_in :password, with: 'password'

    click_on 'Sign in'

    assert_selector 'h1', text: 'Tramontana Dash ADD APP'

    # page.driver.debug(binding)

    # Report Craft
    click_link(id: '1')

    assert_selector 'h1', text: 'Editing access'
  end
end
