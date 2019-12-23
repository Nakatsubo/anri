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
  header_modal_open.addEventListener('click', (e) => {
    let modal = document.getElementById('header-modal');
    $(modal).fadeIn();
    return false;
  }, false);

  const header_modal_close = document.getElementById('header-modal-close');
  header_modal_close.addEventListener('click', (e) => {
    let modal = document.getElementById('header-modal');
    $(modal).fadeOut();
    return false;
  }, false);

  // function-modal
  const footer_modal_open = document.getElementById('footer-modal-open');
  footer_modal_open.addEventListener('click', (e) => {
    //home_is_active.classList.add('fillするカラーのクラスを追加');
    //function_is_active.classList.add('fillするカラーのクラスを追加');
    let modal = document.getElementById('footer-modal');
    $(modal).fadeIn();
    return false;
  }, false);

  const footer_modal_close = document.getElementById('footer-modal-close');
  footer_modal_close.addEventListener('click', (e) => {
    //home_is_active.classList.add('fillするカラーのクラスを追加');
    //function_is_active.classList.add('fillするカラーのクラスを追加');
    let modal = document.getElementById('footer-modal');
    $(modal).fadeOut();
    return false;
  }, false);

  // photo-modal // only-open
  const photo_modal_open = document.getElementById('photo-modal-open');
  photo_modal_open.addEventListener('click', (e) => {
    //home_is_active.classList.add('fillするカラーのクラスを追加');
    //nav_is_active.classList.add('fillするカラーのクラスを追加');
    let modal = document.getElementById('photo-modal');
    $(modal).fadeIn();
    return false;
  }, false);

  // dustmox-modal
  const dustbox_modal_open = document.getElementById('dustbox-modal-open');
  dustbox_modal_open.addEventListener('click', (e) => {
    let modal = document.getElementById('dustbox-modal');
    $(modal).fadeIn();
    return false;
  }, false);

  const dustbox_modal_close = document.getElementById('dustbox-modal-close');
  dustbox_modal_close.addEventListener('click', (e) => {
    let modal = document.getElementById('dustbox-modal');
    $(modal).fadeOut();
    return false;
  }, false);

  // retweet-modal // only-open
  const retweet_modal_open = document.getElementById('retweet-modal-open');
  retweet_modal_open.addEventListener('click', (e) => {
    let modal = document.getElementById('retweet-modal');
    $(modal).fadeIn();
    return false;
  }, false);

  // preview
  const photo_form = document.getElementById('photo-form');
  photo_form.querySelector('input[type="file"]').addEventListener('change', (e) => {
    let file = e.target.files[0],
        reader = new FileReader(),
        $preview =  document.getElementById('preview'),
        t = this;
    if(file.type.indexOf("image") < 0){
      return false;
    }
    reader.onload = (function(file) {
      return function(e) {
        while ($preview.firstChild) $preview.removeChild($preview.firstChild);
            let img = document.createElement('img');
            img.setAttribute('src',  e.target.result);
            $preview.appendChild(img);
      };
    })(file);
    reader.readAsDataURL(file);
  }, false);

}, false);
