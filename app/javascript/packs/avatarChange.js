'use strict'

const avatarUpload = () => {
  const avatar = document.querySelector('.avatar-change');
  const uploadedFile = document.getElementById('kid_photo');
  uploadedFile.addEventListener('change', (event) => {
    avatar.src = URL.createObjectURL(event.target.files[0])
  })
}

let imageNumber = 0;
const avatarChange = () => {
  const imageArray = [
    'http://res.cloudinary.com/djznzpxie/image/upload/v1605278963/a2arj2cwknqttflqlfyw.jpg',
    'http://res.cloudinary.com/djznzpxie/image/upload/v1605521818/n2kntw39xkn8yqrlyc3a.jpg',
    'http://res.cloudinary.com/djznzpxie/image/upload/v1605521890/cpyws8gutkppj0qbdbl6.jpg',
    'https://res.cloudinary.com/djznzpxie/image/upload/v1599132664/qvzeie3uoo61g5e8zyb2.svg',
    'http://res.cloudinary.com/djznzpxie/image/upload/v1605521932/zraibyx3bg1yibw1n9bb.png',
    'http://res.cloudinary.com/djznzpxie/image/upload/v1605521962/kxsf9gmfujryhnw7zkas.jpg',
    'http://res.cloudinary.com/djznzpxie/image/upload/v1605521770/l8uhnqjgzw1tzx62gq5s.webp',
    'http://res.cloudinary.com/djznzpxie/image/upload/v1605522038/qijccbnrlghucsqebnzx.png',
    'http://res.cloudinary.com/djznzpxie/image/upload/v1605522065/beyxijm7zjitpgvlaxep.png',
    'https://res.cloudinary.com/djznzpxie/image/upload/v1599125065/okd26heqffak0vzi5oi3.svg'
  ];
  const avatar = document.querySelector('.avatar-change');
  const avatarField = document.getElementById('kid_avatar_key');
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
export { avatarUpload }
