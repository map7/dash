require "application_system_test_case"

class DashboardsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit dashboard_index_url
  
    assert_selector "h1", text: "Sign in"
    
  end
end
