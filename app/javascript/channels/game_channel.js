import consumer from "./consumer";

const initGameCable = () => {
  const messagesContainer = document.getElementById('gameInfo');
  if (messagesContainer) {
    const id = messagesContainer.dataset.gameId;
    console.log(id)
    consumer.subscriptions.create({ channel: "GameChannel", id: id }, {
      received(data) {
        if (data.type == "start game") {
          // startGame();
        }
        const mainbody = document.getElementById("mainbody") // main body
        mainbody.innerHTML = ""
        mainbody.innerHTML = data
        //Turbolinks.clearCache();
        //Turbolinks.visit("");
      },
    });
  }
}

export { initGameCable };

const startGame = () => {
  const overlay = document.getElementById('overlayBack');
  overlay.classList.add('hide');
}
