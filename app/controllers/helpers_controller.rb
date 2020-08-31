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
    @helper = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
