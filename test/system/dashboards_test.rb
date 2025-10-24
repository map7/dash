require 'application_system_test_case'

class DashboardsTest < ApplicationSystemTestCase
  test 'Login and direct to the first app' do
    visit dashboard_index_url
    login_user
    assert_selector 'h1', text: 'Tramontana Dash ADD APP'

    # page.driver.debug(binding)
    # Google link
    click_link(id: '0')
  end

  test 'Login and direct to the second app and asks for password' do
    visit dashboard_index_url
    login_user
    assert_selector 'h1', text: 'Tramontana Dash ADD APP'

    # Report Craft
    click_link(id: '1')

    assert_selector 'h1', text: 'Editing access'
  end
end
