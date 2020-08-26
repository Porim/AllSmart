const myMove = () => {
  const elem = document.getElementById("rocket");
  let pos = 100;
  const id = setInterval(frame, 10);
  console.log(window.innerWidth);
  console.log(window.innerHeight);
  function frame() {
    if (pos >= window.innerWidth +100) {
      clearInterval(id);
      elem.style.setProperty('display', 'none', 'important');
    } else {
      pos += 1.5;
      console.log(pos);
      elem.style.left = pos + 'px';
      // elem.style.left = pos + 'px';
    }
  }
}

export { myMove }
