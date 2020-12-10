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

export { topFunction }
