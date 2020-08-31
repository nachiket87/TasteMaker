import consumer from "./consumer";
import { showNotificationContent } from "../components/navbar";

const initNotificationCable = () => {
  const currentUserMetaTag = document.querySelector("meta[name='current_user_id']");
  const notificationsContainer = document.querySelector(".notificationContainer");
  if (currentUserMetaTag) {
    const id = currentUserMetaTag.content;

    consumer.subscriptions.create({ channel: "NotificationChannel", id: id }, {
      received(data) {
        if (data.wrong_answer){
          Array.from(document.getElementsByClassName('btn')).forEach((button) => {
            console.log(button.innerText, data.wrong_answer)
            if (button.innerText == data.wrong_answer) { button.style.backgroundColor = '#ff5555'; }
          })
        }else{
        notificationsContainer.innerHTML = data;
        showNotificationContent();
        }
      },
    })
  }
}
export { initNotificationCable };
