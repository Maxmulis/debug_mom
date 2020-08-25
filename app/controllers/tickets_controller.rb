class TicketsController < ApplicationController
  def index
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.mom = User.first
    @ticket.helper = User.last

    binding.pry
    if @ticket.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:description, photos: [])
  end
end
