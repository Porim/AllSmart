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
import { navbarScroll } from './navbar_on_scroll'
import { ask, moveForward, displayQuestion } from './wagon_race'
import { topFunction } from './scrollTopButtons'
import { landingArrow } from './orangeArrow'
import { fullScreenNav } from './mobileNavbar'
import { avatarChange } from './avatarChoice'
import { avatarUpload } from './avatarChoice'
// import { mobileFormScroll } from './focusScrollAndroid'
//If statements are added to prevent calling of JS functions on irrelevant pages.

document.addEventListener('turbolinks:load', () => {
  if (document.getElementById("player1-race")) {
    displayQuestion(0, 0);
  }
  if (document.getElementById("bg-image-landing")) {
    AOS.init();
    landingArrow();
  }
  if (document.getElementById('bg-image-landing') && screen.width >
    729) {
    navbarScroll();
  }
  if (document.getElementById("arrow-footer")) {
    topFunction();
  }
  if (document.querySelector('.navbar-toggler')) {
    fullScreenNav();
  }
  if (document.querySelector('.avatar-change')) {
    avatarChange();
    avatarUpload();
  }
});
