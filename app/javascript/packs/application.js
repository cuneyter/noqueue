// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import { refresh_position } from '../src/refresh';
// import { initSweetalert } from '../plugins/init_sweetalert';

Rails.start();
Turbolinks.start();
ActiveStorage.start();


// ----------------------------------------------------
// Note: ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
// import 'swiper';
import {initSwiper} from '../main';
// import 'swiper/swiper-bundle.css';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initSwiper();
  refresh_position();
});

// sweet_alert pop up alert for leaving

// initSweetalert('#alert-leaving', {
//   title: "Are you sure you want to leave the queue?",
//   buttons: true,
//   dangerMode: true,
//   icon: "warning"
// }, (value) => {
//   const link = document.querySelector('#leave-link');
//   link.click();
// });

