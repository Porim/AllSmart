const mobileFormScroll = () => {
  const formControl = document.querySelectorAll('.form-control');
  const formGroup = document.querySelectorAll('label');
  const scrollBack = (index) => {
    formGroup[index].scrollTop = 0;
    console.log(formGroup[index]);
  }
  for (let i = 0; i < formControl.length; i++) {
    formControl[i].addEventListener('focus', (e) => {
        setTimeout(scrollBack(i), 5000);
    })
  }
}

export { mobileFormScroll }
