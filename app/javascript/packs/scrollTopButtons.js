// Function for the back-to-top button in the footer 
const topFunction = () => {
  const topButton = document.getElementById("arrow-footer");
  topButton.addEventListener('click', () => {
    document.body.scrollTop = 0; // For Safari
    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
  })
}

export { topFunction }
