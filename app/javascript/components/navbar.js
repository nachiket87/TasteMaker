const showNotificationContent = () => {
  const button = document.getElementById("noti-drop");
  const notiList = document.getElementById("notiDropDown")
  if (button) {
    button.addEventListener('click', (event) => {
      event.preventDefault();
      notiList.classList.toggle("show");
    });
  }
  const declines = document.querySelectorAll(".decline-button");
  declines.forEach((decline) => {
    decline.addEventListener('click', (event) => {
      event.preventDefault();
      decline.parentElement.innerHTML = "";
    });
  });

  const accepts = document.querySelectorAll(".accept-button");
  accept.forEach((accept) => {
    accept.addEventListener('click', (event) => {
      event.preventDefault();
      accept.parentElement.innerHTML = "";
    });
  });
}


export { showNotificationContent };
