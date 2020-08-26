class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.mom = true
    # to be done
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
