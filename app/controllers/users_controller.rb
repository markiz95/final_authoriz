class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    session[:user_id] = @user.id
    @current_user = @user
    redirect_to "/"
  end

  private

  def user_params
      params.require(:user).permit(:name, :provider, :uid)
  end
end
