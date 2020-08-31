import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["..."],
    typeSpeed: 100,
    loop: true,
    showCursor: false
  });
}

export { loadDynamicBannerText };