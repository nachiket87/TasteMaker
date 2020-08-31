import consumer from "./consumer";

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
            console.log(button.innerText, data.correct_answer)
            if (button.innerText == data.correct_answer) { button.style.backgroundColor = '#50fa7b'; }
          })
          setTimeout(() => loadResult(data, resultDiv), 1000);
          setTimeout(() => loadNext(data, mainbody), 6000);
        } else if (data.page2){
          loadNext(data, mainbody);
        } else {
          mainbody.innerHTML = "";
          mainbody.innerHTML = data;
        }
      },
    });
  }
}
const loadNext = (data, mainbody) => {
      mainbody.innerHTML = "";
      mainbody.innerHTML = data.page2;
}

<<<<<<< HEAD
=======
const loadResult = (data, resultDiv) => {
  resultDiv.innerHTML = "";
  resultDiv.innerHTML = data.round_end;
}

const startTimer = (data, mainbody) => {
  mainbody.innerHTML = "";
  mainbody.innerHTML = data.firstStart;
  setTimeout(() => loadNext(data, mainbody), 5000);
}
>>>>>>> lenoy-backend
export { initGameCable };

