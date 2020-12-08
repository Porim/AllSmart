let clickCounter = 0;

const decolorNavbarMain = () => {
  const navbarCollapse = document.querySelector('.navbar-collapse.collapse.show');
  const navbarNav = document.querySelectorAll('.navbar-nav');
  const navbarMain = document.querySelector('.navbar-main');
  navbarMain.style.background = 'url(https://res.cloudinary.com/djznzpxie/image/upload/v1598455211/mvtrrjfbxypqirgizjd5.svg)';
  navbarNav.forEach((el) => {
      el.style.minHeight = 'auto';
      el.style.background = 'none';
    })
  navbarCollapse?.classList.remove('show');
  clickCounter = 0;
}


const removeFullScreenNav = () => {
  window.addEventListener('resize', () => {
    if (window.innerWidth > 700 && (clickCounter % 2 >= 1)) {
      decolorNavbarMain();
    }
  })
}

const fullScreenNav = () => {
  const navToggler = document.querySelector('.navbar-toggler');
  const navbarNav = document.querySelector('.navbar-nav');
  const navbarMain = document.querySelector('.navbar-main');
  navToggler.addEventListener('click', () => {
    clickCounter += 1
    if (clickCounter % 2 === 0) {
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
export { fullScreenNav, removeFullScreenNav, decolorNavbarMain }
