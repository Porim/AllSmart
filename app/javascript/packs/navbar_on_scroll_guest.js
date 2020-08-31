const navbarGuest = () => {
  const elem = document.getElementById('bg-image-landing');
  const login = document.querySelector('.login-button');
  const aboutUs = document.querySelector('#about-us-js');
  const height = elem.getBoundingClientRect().height;
  addEventListener('scroll', () => {
    const navbar = document.querySelector('#navbar-lewagon')
    const scrollTop = $(window).scrollTop();
    if (scrollTop > height - 100) {
      navbar.style.transition = "0.5s";
      navbar.style.background = "white";
      login.id = 'scroll-login';
      aboutUs.id = "about-us-onscroll";
    } else {
      navbar.style.background = "transparent";
      login.id = '';
      aboutUs.id = 'about-us-js';
    }
  })
}

export { navbarGuest }
