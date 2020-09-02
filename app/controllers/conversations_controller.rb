class ConversationsController < ApplicationController
  def show
     @conversation = Conversation.find(params[:id])
     @ticket = Ticket.find(params[:ticket_id])
     @message = Message.new
  end

  def create
    @conversation = Conversation.new
    @ticket = Ticket.find(params[:ticket_id])
    if @conversation.save
      # redirect_to category_ticket_chat_path(params[:category_id], params[:ticket_id], @chat)
      redirect_to ticket_conversation_path(@conversation)
    else
      raise
    end
  end
end
