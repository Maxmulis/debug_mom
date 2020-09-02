import consumer from "./consumer";

const initConversationCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.conversationId;
    console.log(id);

    consumer.subscriptions.create({ channel: "ConversationChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
        const inputMessage = document.getElementById('message_content');
        inputMessage.value = "";
      },
    });
  }
}

export { initConversationCable };
