class UsersController < ApplicationController
  include Passwordless::ControllerHelpers # <-- This!
  # (unless you already have it in your ApplicationController)
  def new
    @user = User.new
    @ticket = Ticket.find(params[:ticket_id])
  end

  def create
    @user = User.new(user_params)
    @user.mom = true
    @ticket = Ticket.find(params[:ticket_id])

    if @user.save
      #sign_in @user # <-- This!
      @ticket.mom = @user
      @ticket.save
      redirect_to ticket_path(@ticket), flash: { notice: 'Welcome!' }
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:mom, :username, :email)
  end

end
