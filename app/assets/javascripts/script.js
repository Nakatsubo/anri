window.addEventListener('DOMContentLoaded', (e) => {

  // navigation
  let home_is_active = document.getElementById('home-is-active');
  let home_is_inactive = document.getElementById('home-is-inactive');
  let nav_is_active = document.getElementById('nav-is-active');
  let nav_is_inactive = document.getElementById('nav-is-inactive');
  let function_is_active = document.getElementById('function-is-active');
  let function_is_inactive = document.getElementById('function-is-inactive');
  let search_is_active = document.getElementById('search-is-active');
  let search_is_inactive = document.getElementById('search-is-inactive');
  // searchボタンの変更をどう実施するか考える ==> URLが変更されたら？

  // photo-modal
  const photo_modal_open = document.getElementById('photo-modal-open');
  photo_modal_open.addEventListener('click', (e) => {
    home_is_active.style.display = 'none';
    home_is_inactive.style.display = 'block';
    nav_is_active.style.display = 'none';
    nav_is_inactive.style.display = 'block';
    let modal = document.getElementById('photo-modal');
    $(modal).fadeIn(); // by jQuery
    return false;
  }, false);

  const photo_modal_close = document.getElementById('photo-modal-close');
  photo_modal_close.addEventListener('click', (e) => {
    home_is_active.style.display = 'block';
    home_is_inactive.style.display = 'none';
    nav_is_active.style.display = 'block';
    nav_is_inactive.style.display = 'none';
    let modal = document.getElementById('photo-modal');
    $(modal).fadeOut(); // by jQuery
    return false;
  }, false);

  // function-modal
  const footer_modal_open = document.getElementById('footer-modal-open');
  footer_modal_open.addEventListener('click', (e) => {
    home_is_active.style.display = 'none';
    home_is_inactive.style.display = 'block';
    function_is_active.style.display = 'none';
    function_is_inactive.style.display = 'block';
    let modal = document.getElementById('footer-modal');
    $(modal).fadeIn(); // by jQuery
    return false;
  }, false);

  const footer_modal_close = document.getElementById('footer-modal-close');
  footer_modal_close.addEventListener('click', (e) => {
    home_is_active.style.display = 'block';
    home_is_inactive.style.display = 'none';
    function_is_active.style.display = 'block';
    function_is_inactive.style.display = 'none';
    let modal = document.getElementById('footer-modal');
    $(modal).fadeOut(); // by jQuery
    return false;
  }, false);



}, false);
