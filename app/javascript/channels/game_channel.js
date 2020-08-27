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
        console.log("It worked")
        console.log(data); 
        // location.reload();
        Turbolinks.clearCache();
        Turbolinks.visit("");
        // called when data is broadcast in the cable
        
      },
    });
  }
}

export { initGameCable };

const startGame = () => {
  const overlay = document.getElementById('overlayBack');
  overlay.classList.add('hide');
}