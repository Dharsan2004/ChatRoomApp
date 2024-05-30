import consumer from "channels/consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel

    //alert(data.msg)
    const messagesContainer = document.getElementById("messages");
    messagesContainer.insertAdjacentHTML('beforeend', `<div class="message">From <b> ${data.name} </b> ,  ${data.msg}</div>`);

  }
});
