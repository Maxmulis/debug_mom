class UsersController < ApplicationController
  include Passwordless::ControllerHelpers # <-- This!
  # (unless you already have it in your ApplicationController)
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.mom = true
    if @user.save
      sign_in @user # <-- This!
      redirect_to users_sign_in_path, flash: { notice: 'Welcome!' }
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:mom, :username, :email)
  end

end
