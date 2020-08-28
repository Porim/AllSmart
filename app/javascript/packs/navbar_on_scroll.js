const navbar = () => {
  const elem = document.getElementById('bg-image-landing');
  const login = document.querySelector('.login-button');
  const aboutUs = document.querySelector('#about-us');
  console.log(aboutUs);
  console.log(login);
  const height = elem.getBoundingClientRect().height;
  addEventListener('scroll', () => {
    const navbar = document.querySelector('#navbar-lewagon')
    const scrollTop = $(window).scrollTop();
    if (scrollTop > height - 100) {
      navbar.style.transition = "1s";
      navbar.style.background = "white";
      login.id = 'scroll-login';
      aboutUs.setAtribute('color','#575757 !important');
    } else {
      navbar.style.background = "transparent";
      login.id = '';
    }
  })
}

export { navbar }
