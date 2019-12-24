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

  // header-modal
  if (document.getElementById('header-modal-open')) {
    const header_modal_open = document.getElementById('header-modal-open');
    header_modal_open.addEventListener('click', (e) => {
      let modal = document.getElementById('header-modal');
      $(modal).fadeIn();
      return false;
    }, false);
  };

  if (document.getElementById('header-modal-close')) {
    const header_modal_close = document.getElementById('header-modal-close');
      header_modal_close.addEventListener('click', (e) => {
      let modal = document.getElementById('header-modal');
      $(modal).fadeOut();
      return false;
    }, false);
  };

  // function-modal
  if (document.getElementById('footer-modal-open')) {
    const footer_modal_open = document.getElementById('footer-modal-open');
    footer_modal_open.addEventListener('click', (e) => {
      let modal = document.getElementById('footer-modal');
      $(modal).fadeIn();
      return false;
    }, false);
  };

  if (document.getElementById('footer-modal-close')) {
    const footer_modal_close = document.getElementById('footer-modal-close');
    footer_modal_close.addEventListener('click', (e) => {
      let modal = document.getElementById('footer-modal');
      $(modal).fadeOut();
      return false;
    }, false);
  };

  // photo-modal // only-open
  if (document.getElementById('photo-modal-open')) {
    const photo_modal_open = document.getElementById('photo-modal-open');
    photo_modal_open.addEventListener('click', (e) => {
      let modal = document.getElementById('photo-modal');
      $(modal).fadeIn();
      if (document.getElementById('home-is-active') && (document.getElementById('nav-is-active'))) {
        if (document.getElementById('home-is-active')) {
          const home_is_active = document.getElementById('home-is-active');
          home_is_active.classList.add('is-noactive');
          const nav_is_active = document.getElementById('nav-is-active');
          nav_is_active.classList.add('is-active');
        }
      };
      return false;
    }, false);
  };

  // dustmox-modal
  if (document.getElementById('dustbox-modal-open')) {
    const dustbox_modal_open = document.getElementById('dustbox-modal-open');
    dustbox_modal_open.addEventListener('click', (e) => {
      let modal = document.getElementById('dustbox-modal');
      $(modal).fadeIn();
      return false;
    }, false);
  };

  if (document.getElementById('dustbox-modal-close')) {
    const dustbox_modal_close = document.getElementById('dustbox-modal-close');
    dustbox_modal_close.addEventListener('click', (e) => {
      let modal = document.getElementById('dustbox-modal');
      $(modal).fadeOut();
      return false;
    }, false);
  };

  // retweet-modal // only-open
  if (document.getElementById('retweet-modal-open')) {
    const retweet_modal_open = document.getElementById('retweet-modal-open');
    retweet_modal_open.addEventListener('click', (e) => {
      let modal = document.getElementById('retweet-modal');
      $(modal).fadeIn();
      return false;
    }, false);
  };

  // preview
  if (document.getElementById('photo-form')) {
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
  };

}, false);
