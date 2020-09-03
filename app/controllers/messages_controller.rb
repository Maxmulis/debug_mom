class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(message_params)
    @message.conversation = @conversation
    @message.user = current_user
    if @message.save!
      ConversationChannel.broadcast_to(@conversation, {
        html: render_to_string(partial: "message", locals: { message: @message}),
        user_id: current_user.id,
        message_id: @message.id
      })
      # redirect_to ticket_conversation_path(@conversation, anchor: "message-#{@message.id}")
    else
      render "conversation/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
