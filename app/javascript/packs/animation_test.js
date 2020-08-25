const myMove = () => {
  var elem = document.getElementById("rocket");
  var pos = 100;
  var id = setInterval(frame, 10);
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
