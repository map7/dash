require "application_system_test_case"

class AppsTest < ApplicationSystemTestCase
  setup do
    @app = apps(:three)
  end

  test "should create app" do
    visit dashboard_index_url
    login_user

    click_on "ADD APP"

    fill_in "Description", with: @app.description
    fill_in "Global login", with: @app.global_login
    fill_in "Global password", with: @app.global_password
    fill_in "Name", with: @app.name
    fill_in "Url", with: @app.url
    click_on "Create App"

    assert_selector 'h1', text: 'Tramontana Dash ADD APP'
    assert_text "Feather WIKI"
  end

  test "should update App" do
    visit dashboard_index_url
    login_user

    click_on "edit2"

    fill_in "Description", with: "Foobar"
    fill_in "Global login", with: @app.global_login
    fill_in "Global password", with: @app.global_password
    fill_in "Name", with: @app.name
    fill_in "Url", with: @app.url

    click_on "Update App"

    # assert_text "App was successfully updated"

    assert_selector 'h1', text: 'Tramontana Dash ADD APP'
    assert_text "Foobar"
  end

  # test "should destroy App" do
  #   visit app_url(@app)
  #   accept_confirm { click_on "Destroy this app", match: :first }

  #   assert_text "App was successfully destroyed"
  # end
end
