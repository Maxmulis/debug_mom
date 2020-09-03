import consumer from "./consumer";

const initConversationCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.conversationId;
    const santi = document.querySelector('.santi')
    const userId = santi.dataset.userId
    console.log(userId);

    consumer.subscriptions.create({ channel: "ConversationChannel", id: id }, {
      received(data) {
        //console.log(data)
        // if(data.getElementById('author_user').innerHTML != data.getElementById('current_user').innerHTML){
        //   console.log("different")
        // } else {
        //   console.log("same")
        // }

        console.log(data.user_id)
        if (data.user_id == userId){
          //console.log(data.html.querySelector("#santi-container"))

          messagesContainer.insertAdjacentHTML('beforeend', data.html);

        } else {
          console.log("This should be here")
          messagesContainer.insertAdjacentHTML('beforeend', data.html);
          console.log(data)
          const message = document.querySelector(`[data-message-id='${data.message_id}']`);
          //document.querySelectorAll('[data-genre~="horror"]');
          console.log(message)
          const wrapper = message.querySelector(".right-wrapper")
          wrapper.classList.add("left-wrapper")
          wrapper.classList.remove("right-wrapper")
          const rightSide = message.querySelector(".right-side")
          rightSide.classList.add("left-side")
          rightSide.classList.remove("right-side")
        }


        // messagesContainer.insertAdjacentHTML('beforeend', data.html);
        // var content = messagesContainer.innerHTML;
        // messagesContainer.innerHTML= content;
        // window.location.reload();
        const inputMessage = document.getElementById('message_content');
        inputMessage.value = "";
      },
    });
  }
}

export { initConversationCable };
