class DashboardController < ApplicationController
  def index
    @apps = Current.user.apps
  end
end
