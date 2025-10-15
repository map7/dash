class DashboardController < ApplicationController
  def index
    
    # @apps = Current.user.apps.order(:menu_position)
    @accesses = Current.user.accesses.includes(:app).order(:menu_position)
  end

  def show
    app = App.find(params[:id])
    access = Current.user.access_for(app)

    @login = access.login.to_s.length == 0 ? app.global_login : access.login
    @password = access.password.to_s.length == 0 ? app.global_password : access.password

    if (@password.nil? or @password.length == 0) and access.auto_login != 'None'
    
      # Edit the password
      redirect_to edit_access_path(access)

    else
      # If we have a password then go to the website
      if access.auto_login == 'Basic Auth'
        url = app.url.split('//').insert(1, "//#{@login}:#{@password}@").join()
        redirect_to url, allow_other_host: true
      else
        @url = app.url
        @auto_login = access.auto_login
        
        render :show
        # redirect_to app.url, allow_other_host: true
      end
    end    
  end
end
