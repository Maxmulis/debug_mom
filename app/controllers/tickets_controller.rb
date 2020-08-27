class TicketsController < ApplicationController
  # before_action :require_user!
  def index
  end

  def show
    @ticket = Ticket.find(params[:id])
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

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update(ticket_params)
    redirect_to ticket_path(@ticket)
  end

  private

  def ticket_params
    params.require(:ticket).permit(:description, photos: [])
  end
end
