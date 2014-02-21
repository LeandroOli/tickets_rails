class SessionsController < ApplicationController
  layout "login"
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      login(user)
      redirect_to user.redirect_path, notice: 'Logged in'
    else
      flash.now.alert = "Email or password is invalid."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end
end
