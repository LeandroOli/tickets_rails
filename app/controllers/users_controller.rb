class UsersController < ApplicationController
  layout "pages"
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to new_company_path, notice: "Account successfully created! Now, register your company"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :name)
  end

end