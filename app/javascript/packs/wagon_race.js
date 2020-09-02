

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
  const wagon = document.querySelector(
    `#player${player}-race .active`);
  if (wagon.nextElementSibling) {
    wagon.nextElementSibling.classList.add('active');
    wagon.classList.remove('active');
  } else {
    alert(`You Win!`);
    window.location.reload();
  }
};

const displayQuestion = (index) => {
  const question = ask();
  if (index < 20) {
    const quiz = document.querySelector(".question");
    quiz.innerText = question.question;
    document.addEventListener("keyup", (event) => {
      if (event.key == question.answer) {
        moveForward(1);
        displayQuestion(index);
      } else if (parseInt(event.key)) {
        moveForward(2);
        displayQuestion(index);
      } else {
        displayQuestion(index);
      }
    }, { once: true });
  }
};

export { displayQuestion, moveForward, ask }
