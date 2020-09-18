const landingArrow = () => {
  const arrow = document.getElementById('large-landing-arrow');
  if (window.innerWidth > 1420) {
    arrow.href = 'javascript:void(0)'
  } else {
    arrow.href = '/#large-arrow'
  }
}

export { landingArrow }
