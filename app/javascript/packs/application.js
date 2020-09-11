// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { navbarGuest } from './navbar_on_scroll_guest'
import { navbarUser } from './navbar_on_scroll_user'
import { ask, moveForward, displayQuestion } from './wagon_race'
// import { myMove } from './animation_test'
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
//document.onmouseover=function(e){if(e.target.parentNode.classList&&e.target.parentNode.classList.contains('tooltip')){console.dir(e.target)}}
document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  // myMove();
  if (document.getElementById("player1-race")) {
    displayQuestion(0, 0);
  }
  if (document.getElementById("bg-image-landing")) {
    AOS.init();
  }
  if (document.getElementById('bg-image-landing')) {
    navbarUser();
  }
  if (document.getElementById('bg-image-landing')) {
    navbarGuest();
  }
});
