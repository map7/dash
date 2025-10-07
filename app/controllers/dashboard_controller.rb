class DashboardController < ApplicationController
  def index
    @apps = Current.user.apps
  end

  def show
    app = App.find(params[:id])

    access = Current.user.access_for(app)

    if access.password.nil? or access.password.length == 0
      # Edit the password
      redirect_to edit_access_path(access)

    else
      # If we have a password then go to the website
      redirect_to app.url, allow_other_host: true
    end    
  end
end
