class UsersController < ApplicationController
  def new
    # @ticket = Ticket.find(params["ticket_id"])
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.mom = true

    if @user.save
      @ticket = Ticket.find(params["ticket_id"])
      @ticket.mom = params["ticket_id"]
      redirect_to root_path
      binding.pry
    else
      render :new
    end

  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
