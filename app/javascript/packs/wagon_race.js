

const ask = () => {
  let x = Math.floor(Math.random() * 5) + 1;
  let y = Math.floor(Math.random() * 4) + 1;
  let op = ["+", "-"][Math.floor(Math.random() * 2)];
  let problem = 0;
  if ((x - y) > 0) {
    problem = { question: `How much is ${x}${op}${y}`, answer: eval(x +
        op + y) };
  } else {
    problem = { question: `How much is ${x} + ${y}`, answer: eval(
        `${x} + ${y}`) };
  }
  return problem;

};

const moveForward = (player) => {
  const wagon = document.querySelector(`#player${player}-race .active`);
  if (wagon.nextElementSibling) {
    wagon.nextElementSibling.classList.add('active');
    wagon.classList.remove('active');
  } else {
    const quiz = document.querySelector(".question");
    quiz.innerText = "Congratulations, you win! You've won 15xp"
    // document.addEventListener("")
    // window.location.reload();
  }
};

const displayQuestion = (correct, incorrect) => {
  const question = ask();
  const quiz = document.querySelector(".question");
  quiz.innerText = question.question;
  if ((correct < 10) && (incorrect < 10)) {
    document.addEventListener("keyup", (event) => {
      if (event.key == question.answer) {
        moveForward(1);
        correct++;
        displayQuestion(correct, incorrect);
      } else if (parseInt(event.key)) {
        moveForward(2);
        incorrect++;
        displayQuestion(correct, incorrect);
      } else {
        displayQuestion(correct, incorrect);
      }
    }, { once: true });
  } else if (correct == 10) {
    quiz.innerText = "Congratulations, you've won 15xp"
    // select button and set its display to block
    document.getElementById("update-score").style.display = "block";
    document.getElementById("back-to").style.display = "none";
  } else {
    quiz.innerText = "You lost! Try again!"
  }
};

export { displayQuestion, moveForward, ask }
