class TicketsController < ApplicationController
  before_action :require_user!
  def index
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to new_ticket_user_path(@ticket)
    else
      render :new
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:description, photos: [])
  end
end
