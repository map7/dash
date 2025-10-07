class DashboardController < ApplicationController
  def index
    @apps = Current.user.apps
  end

  def show
    app = App.find(params[:id])
    redirect_to app.url, allow_other_host: true
  end
end
