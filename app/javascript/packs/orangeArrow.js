// This function creates link on the large orrange arrow in how-it-works section of the landing page on the standard size viwports. On larger vieports link is not created, as the whole of how-it-works section is displayed. 
const landingArrow = () => {
  const arrow = document.getElementById('large-landing-arrow');
  if (window.innerWidth < 1500) {
    arrow.href = '/#large-arrow'
  }
}

export { landingArrow }
