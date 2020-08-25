const myMove = () => {
  const elem = document.getElementById("rocket");
  let pos = 100;
  const id = setInterval(frame, 10);

  function frame() {
    if (pos == 1800) {
      clearInterval(id);
    } else {
      pos += 1.5;
      elem.style.left = pos + 'px';
      // elem.style.left = pos + 'px';
    }
  }
}

export { myMove }
