const rocketAnimation = () => {
  const rocket = document.querySelector('#rocket-landing');
  const body = document.body.getBoundingClientRect();
  console.log(rocket.getBoundingClientRect().top - body.top);
  let posX = rocket.getBoundingClientRect().left;
  let posY = rocket.getBoundingClientRect().top;
  const a = 300;
  const b = 150;
  const id = setInterval(frame, 10);

  function frame() {
    if (posX >= window.innerWidth + 100) {
      clearInterval(id);
      rocket.style.setProperty('display', 'none', 'important');
    } else {
      posX += 1;
      posY = (b ** 2) * (1 - ((posX ** 2) / a ** 2))
      posX = (a ** 2) * (1 - ((posY ** 2) / b ** 2))
      if (posX <= 0) {
        rocket.style.right = Math.sqrt(Math.abs(posX)) + 'px';
      } else {
        rocket.style.left = Math.sqrt(Math.abs(posX)) + 'px';
      }
      if (posY <= 0) {
        rocket.style.bottom = Math.sqrt(Math.abs(posX)) + 'px';
      }
        else {
          rocket.style.top= Math.sqrt(Math.abs(posX)) + 'px';
        }
      }
    }

  }
export { rocketAnimation }
