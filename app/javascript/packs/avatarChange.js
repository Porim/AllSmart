'use strict'

let imageNumber = 0;
const avatarChange = () => {
  const imageArray = [
    'https://res.cloudinary.com/djznzpxie/image/upload/v1599132664/qvzeie3uoo61g5e8zyb2.svg',
    'http://res.cloudinary.com/djznzpxie/image/upload/v1605278963/a2arj2cwknqttflqlfyw.jpg',
    'http://res.cloudinary.com/djznzpxie/image/upload/okd26heqffak0vzi5oi3'
  ];
  const avatar = document.querySelector('.avatar-change');
  const avatarField = document.getElementById('avatar_key');
  avatar.addEventListener('click', () => {
    if (imageNumber < imageArray.length) {
      avatarField.value = imageArray[imageNumber];
      avatar.src = imageArray[imageNumber];
      imageNumber++;
    } else {
      avatarField.value = imageArray[imageNumber];
      avatar.src = imageArray[0];
      imageNumber = 1;
    }
  })

}


export { avatarChange }
