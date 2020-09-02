import consumer from "./consumer";
import { startConfetti } from "../components/confetti";

const initGameCable = () => {
  const messagesContainer = document.getElementById('gameInfo');
  if (messagesContainer) {
    const id = messagesContainer.dataset.gameId;
    consumer.subscriptions.create({ channel: "GameChannel", id: id }, {
      received(data) {
        const mainbody = document.getElementById("mainbody") // main body
        if (data.round_end && data.page2 && data.correct_answer) {
          const resultDiv = document.getElementById('answers')
          Array.from(document.getElementsByClassName('btn')).forEach((button) => {
            if (button.innerText == data.correct_answer) { button.style.backgroundColor = '#50fa7b'; }
          })
          setTimeout(() => loadResult(data, resultDiv), 1000);
          setTimeout(() => loadNext(data, mainbody), 2000);
        } else if (data.page2){
          loadNext(data, mainbody);
        } else {
          mainbody.innerHTML = "";
          mainbody.innerHTML = data;
          startConfetti();
        }
      },
    });
  }
}
const loadNext = (data, mainbody) => {
  mainbody.innerHTML = "";
  mainbody.innerHTML = data.page2;
}

const loadResult = (data, resultDiv) => {
  resultDiv.innerHTML = "";
  resultDiv.innerHTML = data.round_end;
}

export { initGameCable };

