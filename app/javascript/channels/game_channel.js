import consumer from "./consumer";

const initGameCable = () => {
  const messagesContainer = document.getElementById('gameInfo');
  if (messagesContainer) {
    const id = messagesContainer.dataset.gameId;
    consumer.subscriptions.create({ channel: "GameChannel", id: id }, {
      received(data) {
        const mainbody = document.getElementById("mainbody") // main body
        if (data.winner && data.page2) {
          mainbody.innerHTML = ""
          mainbody.innerHTML = data.winner
          setTimeout(() => loadNext(data, mainbody), 1000);
        } else if (data.page2){
          loadNext(data, mainbody);
        } else {
          mainbody.innerHTML = ""
          mainbody.innerHTML = data
        }
      },
    });
  }
}
const loadNext = (data, mainbody) => {
      mainbody.innerHTML = "";
      mainbody.innerHTML = data.page2;
}

export { initGameCable };

