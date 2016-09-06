class SessionsController < ApplicationController

  def create
    begin
      user = User.from_omniauth(env['omniauth.auth'])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to root_path
  end

  def new
  end

  def destroy
    if current_user
      session[:user_id] = nil
      flash[:success] = 'See you!'
    end
    redirect_to root_path
  end
  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end
end
