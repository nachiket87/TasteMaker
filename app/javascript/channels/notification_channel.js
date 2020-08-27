import consumer from "./consumer";
import { showNotificationContent } from "../components/navbar";

const initNotificationCable = () => {
  const currentUserMetaTag = document.querySelector("meta[name='current_user_id']");
  const notificationsContainer = document.querySelector(".notificationContainer");
  if (currentUserMetaTag) {
    const id = currentUserMetaTag.content;

    consumer.subscriptions.create({ channel: "NotificationChannel", id: id }, {
      received(data) {
        notificationsContainer.innerHTML = data;
        showNotificationContent();
      },
    })
  }
}
export { initNotificationCable };
