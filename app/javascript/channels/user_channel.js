import consumer from "./consumer";

const initUserCable = () => {
  const currentUserMetaTag = document.querySelector("meta[name='current_user_id']");
  const messagesContainer = document.getElementById('messages');
  if (currentUserMetaTag) {
    const id = currentUserMetaTag.content;
    consumer.subscriptions.create({ channel: "UserChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
      },
    });
  }
}

export { initUserCable };