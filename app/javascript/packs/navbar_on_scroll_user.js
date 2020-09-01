const navbarUser = () => {
  const elem = document.getElementById('bg-image-landing');
  const browse = document.querySelector('#browse-on-scroll');
  const home = document.getElementById('home-on-scroll');
  const navbarToggle = document.querySelector('#user-toggle');
  console.log(navbarToggle)
  const height = elem.getBoundingClientRect().height;
  addEventListener('scroll', () => {
    const navbar = document.querySelector('#navbar-lewagon')
    const scrollTop = $(window).scrollTop();
    if (scrollTop > height - 100) {
      navbar.style.transition = "0.5s";
      navbar.style.background = "white";
      browse.id = "about-us-onscroll";
      home.id = "about-us-onscroll";
      navbarToggle.setAttribute('class',
        'avatar dropdown-toggle ml-4 name-user-onscroll');
    } else {
      navbar.style.background = "transparent";
      browse.id = 'browse-on-scroll';
      home.id = 'home-on-scroll';
      navbarToggle.setAttribute('class',
        'avatar dropdown-toggle text-white ml-4')
    }
  })
}

export { navbarUser }
