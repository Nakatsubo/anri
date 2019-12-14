window.addEventListener('DOMContentLoaded', (e) => {

  // navigation
  //let home_is_active = document.getElementById('home-is-active');
  //let nav_is_active = document.getElementById('nav-is-active');
  //let function_is_active = document.getElementById('function-is-active');
  //let search_is_active = document.getElementById('search-is-active');
  // searchボタンの変更をどう実施するか考える ==> URLが変更されたら？

  // photo-modal
  const photo_modal_open = document.getElementById('photo-modal-open');
  photo_modal_open.addEventListener('click', (e) => {
    //home_is_active.classList.add('fillするカラーのクラスを追加');
    //nav_is_active.classList.add('fillするカラーのクラスを追加');
    let modal = document.getElementById('photo-modal');
    $(modal).fadeIn(); // by jQuery
    return false;
  }, false);

  const photo_modal_close = document.getElementById('photo-modal-close');
  photo_modal_close.addEventListener('click', (e) => {
    //home_is_active.classList.add('fillするカラーのクラスを追加');
    //nav_is_active.classList.add('fillするカラーのクラスを追加');
    let modal = document.getElementById('photo-modal');
    $(modal).fadeOut(); // by jQuery
    return false;
  }, false);

  // function-modal
  const footer_modal_open = document.getElementById('footer-modal-open');
  footer_modal_open.addEventListener('click', (e) => {
    //home_is_active.classList.add('fillするカラーのクラスを追加');
    //function_is_active.classList.add('fillするカラーのクラスを追加');
    let modal = document.getElementById('footer-modal');
    $(modal).fadeIn(); // by jQuery
    return false;
  }, false);

  const footer_modal_close = document.getElementById('footer-modal-close');
  footer_modal_close.addEventListener('click', (e) => {
    //home_is_active.classList.add('fillするカラーのクラスを追加');
    //function_is_active.classList.add('fillするカラーのクラスを追加');
    let modal = document.getElementById('footer-modal');
    $(modal).fadeOut(); // by jQuery
    return false;
  }, false);

}, false);
