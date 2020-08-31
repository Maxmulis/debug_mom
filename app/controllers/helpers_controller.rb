class HelpersController < ApplicationController
  include Passwordless::ControllerHelpers

  def index
  end

  def new
    @helper = User.new
  end

  def create
    @helper = User.new(user_params)
    @helper.mom = false

    if @helper.save
      sign_in @helper # <-- This!
      # raise
      redirect_to helper_path(@helper), flash: { notice: 'Welcome!' }
    else
      render :new
    end
  end

  def show
    require_user!
    @helper = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end

  def require_user!
    return if current_user
    redirect_to users_sign_in_path, flash: { error: 'You are not worthy!' }
  end
end
