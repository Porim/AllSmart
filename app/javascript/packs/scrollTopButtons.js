// Function for the back-to-top button in the footer 
const topFunction = () => {
  const topButton = document.getElementById("arrow-footer");
  topButton.addEventListener('click', () => {
    document.body.scrollTo({
      top: 0,
      behavior: "smooth"
    })
    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
  })
}

const scrollingLogic = () => {
  const sectionOne = document.querySelector('.section-1');
  const navbar = document.querySelector('.navbar');
  const sectionOneCoordinates = sectionOne.getBoundingClientRect();
  window.scrollTo({
    top: (sectionOneCoordinates.top + window.pageYOffset) -
      Number.parseFloat(
        getComputedStyle(navbar).height),
    left: sectionOneCoordinates.left + window.pageXOffset,
    behavior: 'smooth'
  })
}

const scrollToSection = () => {
  const btnScroll = document.querySelector('#btn-get-started');
  const aboutUs = document.querySelector('#about-us-link')
  btnScroll.addEventListener('click', scrollingLogic);
  aboutUs.addEventListener('click', scrollingLogic);
}
export { topFunction }
export { scrollToSection }
