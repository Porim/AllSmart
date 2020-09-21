// Changes apperance of navbar function on scroll, for both cases, when user is sgined in, and when not. aboutUs is a link appearing in navbar is user is not signed. If this element and testimonial container are found, first if statement is executed. If about-us is not found, but testimonial-container is found, then second if statement is execetued applying to navbar rendered for the user who is signed-in.
const navbarScroll = () => {
  const aboutUs = document.querySelector('#about-us-link');
  const testimonialContainer = document.querySelector(
    '.testimonial-container');
  addEventListener('scroll', () => {
    if (testimonialContainer && aboutUs) {
      const height = document.getElementById('bg-image-landing').getBoundingClientRect()
        .height;
      const navbar = document.querySelector('#navbar-lewagon')
      const scrollTop = $(window).scrollTop();
      const login = document.querySelector('.login-button');
      if (scrollTop > height - 100) {
        navbar.style.transition = "0.5s";
        navbar.style.background = "white";
        login.id = 'scroll-login';
        aboutUs.classList.add('test-navbar-scroll')
      } else {
        navbar.style.background = "transparent";
        login.id = '';
        aboutUs.classList.remove('test-navbar-scroll');
      }
    }
    if (testimonialContainer && !aboutUs) {
      const navbar = document.querySelector('#navbar-lewagon')
      const scrollTop = $(window).scrollTop();
      const children = document.querySelector(
        '#children-on-scroll');
      const browse = document.querySelector('#browse-on-scroll');
      const navFirstName = document.querySelector(
        '#navbar-first-name');
      const height = document.getElementById('bg-image-landing').getBoundingClientRect()
        .height;
      const home = document.getElementById('home-on-scroll');
      if (scrollTop > height - 100) {
        navbar.style.transition = "0.5s";
        navbar.style.background = "white";
        home.classList.add('test-navbar-scroll');
        children.classList.add('test-navbar-scroll');
        browse.classList.add('test-navbar-scroll');
        navFirstName.classList.add('test-navbar-scroll');
      } else {
        navbar.style.background = "transparent";
        home.classList.remove('test-navbar-scroll');
        children.classList.remove('test-navbar-scroll');
        browse.classList.remove('test-navbar-scroll');
        navFirstName.classList.remove('test-navbar-scroll');
      }
    }
  })
}

export { navbarScroll }
