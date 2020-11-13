const passwordField = document.getElementById('user_password');

const showPassword = () => {
  if (passwordField.type === "password") {
    passwordField.type = "text";
  } else {
    passwordField.type = "password";
  }
}

export { showPassword }
