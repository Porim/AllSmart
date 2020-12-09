const fullScreenNav = () => {
  const navToggler = document.querySelector('.navbar-toggler');
  const navbarNav = document.querySelector('.navbar-nav');
  const navbarMain = document.querySelector('.navbar-main');
  const decolorNavbarMain = () => {
    navbarMain.style.transition = '0.15s';
    navbarMain.style.background = 'url(https://res.cloudinary.com/djznzpxie/image/upload/v1598455211/mvtrrjfbxypqirgizjd5.svg)';
  }
  let counter = 0;
  navToggler.addEventListener('click', () => {
    counter += 1
    if (counter % 2 === 0) {
      setTimeout(decolorNavbarMain, 300);
    } else {
      navbarMain.style.transition = '0.0s';
      navbarMain.style.background = '#0E91A1';
      navbarNav.style.minHeight = '100vh';
      navbarNav.style.background = '#0E91A1';
      document.body.style.height = '100vh';
      document.body.style.position = 'relative';
      document.body.style.overflow = 'hidden';
    }
  })
}

export { fullScreenNav }
