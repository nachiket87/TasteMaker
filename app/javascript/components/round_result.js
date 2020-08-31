import Typed from 'typed.js';

const loadDynamicResultText = () => {
  new Typed('#result-typed-text', {
    strings: ["..."],
    typeSpeed: 100,
    loop: true,
    showCursor: false
  });
}

export { loadDynamicResultText };