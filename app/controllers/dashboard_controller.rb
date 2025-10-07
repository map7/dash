class DashboardController < ApplicationController
  def index
    @apps = Current.user.apps
  end

  def show
    app = App.find(params[:id])

    access = Current.user.access_for(app)

    if access.password
      # If we have a password then go to the website
      redirect_to app.url, allow_other_host: true

    else
      # Edit the password
      redirect_to edit_access_path(access)
    end    
  end
end
