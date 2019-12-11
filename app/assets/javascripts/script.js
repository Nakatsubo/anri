window.addEventListener('DOMContentLoaded', (e) => {

  // photo-modal
  const photo_modal_open = document.getElementById('photo-modal-open');
  photo_modal_open.addEventListener('click', (e) => {
    let modal = document.getElementById('photo-modal');
    $(modal).fadeIn(); // by jQuery
    return false;
  }, false);

  const photo_modal_close = document.getElementById('photo-modal-close');
  photo_modal_close.addEventListener('click', (e) => {
    let modal = document.getElementById('photo-modal');
    $(modal).fadeOut(); // by jQuery
    return false;
  }, false);

  // footer-modal => 名前をfooter_modal_~に変えておく
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
