const videoplayer = () => {
  const videoFrame = document.querySelector(".responsive-iframe");
  window.addEventListener("resize", () => {
    resizeVideoFrame(videoFrame);
  })
  resizeVideoFrame(videoFrame);
}

const resizeVideoFrame = (iframe) => {
  if(window.innerWidth <= 640){
    iframe.height = (9 / 16) * window.innerWidth;
  }
}

export { videoplayer, resizeVideoFrame }

