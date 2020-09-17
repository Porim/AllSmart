const topFunction = () => {
  const topButton = document.getElementById("medium-arrow");
  topButton.addEventListener('click', () => {
    document.body.scrollTop = 0; // For Safari
    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
  })
}

export { topFunction }
