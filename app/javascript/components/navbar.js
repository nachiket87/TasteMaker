const showNotificationContent = () => {
  const button = document.getElementById("dLabel");
  const notiList = document.getElementById("notificationContainer");
  const notifications = document.querySelectorAll(".notification-div");
  // if (button) {
  //   button.addEventListener('click', (event) => {
  //     event.preventDefault();
  //     notiList.classList.toggle("show");
  //   });
  // }
  // console.log(accepts.length);

  const declines = document.querySelectorAll(".decline-button");
  declines.forEach((decline) => {
    decline.addEventListener('click', (event) => {
      event.preventDefault();
      decline.parentElement.innerHTML = "";
    });
  });
  let totalNotifications = document.getElementById("notification-number");
  let numberNotifications = notifications.length

  const accepts = document.querySelectorAll(".accept-button");
  accepts.forEach((accept) => {
    accept.addEventListener('click', (event) => {
      accept.parentElement.innerHTML = "";
    });
  });

  const notiButtons = document.querySelectorAll(".noti-btn");
  notiButtons.forEach((notiButton) => {
    notiButton.addEventListener('click', (event) => {
      numberNotifications -= 1;
      totalNotifications.innerHTML = numberNotifications;
    });
  });

  totalNotifications.innerHTML = numberNotifications;
}


export { showNotificationContent };
