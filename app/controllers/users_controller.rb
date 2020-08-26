class UsersController < ApplicationController
  include Passwordless::ControllerHelpers # <-- This!
  # (unless you already have it in your ApplicationController)

  def create
    @user = User.new user_params

    if @user.save
      sign_in @user # <-- This!
      redirect_to @user, flash: { notice: 'Welcome!' }
    else
      render :new
    end
  end

  # ...
end
