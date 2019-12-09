window.addEventListener('DOMContentLoaded', () => {

  // footer-modal
  const js_modal_open = document.getElementById('footer-modal-open');
  js_modal_open.addEventListener('click', (e) => {
    let modal = document.getElementById('footer-modal');
    $(modal).fadeIn(); // by jQuery
    return false;
  }, false);

  const js_modal_close = document.getElementById('footer-modal-close');
  js_modal_close.addEventListener('click', (e) => {
    let modal = document.getElementById('footer-modal');
    $(modal).fadeOut(); // by jQuery
    return false;
  }, false);

}, false);
