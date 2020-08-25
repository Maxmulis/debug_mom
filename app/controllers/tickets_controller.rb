class TicketsController < ApplicationController
  def index
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to root
    else
      render :new
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:description, :photo)
  end
end
