const buttonClicked = () => {
  const buttons = document.getElementsByClassName('btn');
  // if (buttons) {
    Array.from(buttons).forEach((button) => {
      button.addEventListener('click', (event) => {
        event.preventDefault();
        console.log("it working");
        button.classList.add("clicked");
        console.log("it worked");
      })
    });
  // }
}

// export { buttonClicked };