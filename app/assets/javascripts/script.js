window.addEventListener('DOMContentLoaded', (e) => {

  // swiper
  let swiper_option = {
    loop: true,
    effect: 'fade',
    autoplay: {
      delay: 4000,
      disableOnInteraction: false,
    },
    speed: 2000
  };
  new Swiper('.swiper-container', swiper_option);

  // navigation
  //let home_is_active = document.getElementById('home-is-active');
  //let nav_is_active = document.getElementById('nav-is-active');
  //let function_is_active = document.getElementById('function-is-active');
  //let search_is_active = document.getElementById('search-is-active');
  // searchボタンの変更をどう実施するか考える ==> URLが変更されたら？

  // header-modal
  const header_modal_open = document.getElementById('header-modal-open');
  console.log(header_modal_open);
  header_modal_open.addEventListener('click', (e) => {
    let modal = document.getElementById('header-modal');
    $(modal).fadeIn(); // by jQuery
    return false;
  }, false);

  const header_modal_close = document.getElementById('header-modal-close');
  header_modal_close.addEventListener('click', (e) => {
    let modal = document.getElementById('header-modal');
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

  // photo-modal
  const photo_modal_open = document.getElementById('photo-modal-open');
  photo_modal_open.addEventListener('click', (e) => {
    //home_is_active.classList.add('fillするカラーのクラスを追加');
    //nav_is_active.classList.add('fillするカラーのクラスを追加');
    let modal = document.getElementById('photo-modal');
    $(modal).fadeIn(); // by jQuery
    return false;
  }, false);

  //const photo_modal_close = document.getElementById('photo-modal-close');
  //photo_modal_close.addEventListener('click', (e) => {
    //home_is_active.classList.add('fillするカラーのクラスを追加');
    //nav_is_active.classList.add('fillするカラーのクラスを追加');
    //let modal = document.getElementById('photo-modal');
    //$(modal).fadeOut(); // by jQuery
    //return false;
  //}, false);

  // dustmox-modal
  const dustbox_modal_open = document.getElementById('dustbox-modal-open');
  dustbox_modal_open.addEventListener('click', (e) => {
    let modal = document.getElementById('dustbox-modal');
    $(modal).fadeIn(); // by jQuery
    return false;
  }, false);

  const dustbox_modal_close = document.getElementById('dustbox-modal-close');
  dustbox_modal_close.addEventListener('click', (e) => {
    let modal = document.getElementById('dustbox-modal');
    $(modal).fadeOut(); // by jQuery
    return false;
  }, false);

  // retweet-modal
  const retweet_modal_open = document.getElementById('retweet-modal-open');
  retweet_modal_open.addEventListener('click', (e) => {
    let modal = document.getElementById('retweet-modal');
    $(modal).fadeIn(); // by jQuery
    return false;
  }, false);

}, false);
