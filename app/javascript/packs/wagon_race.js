

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
    alert(`Game over!`);
    window.location.reload();
  }
};

const displayQuestion = (index) => {
  const questions = [ask(), ask(), ask(), ask(), ask(), ask(), ask(), ask(), ask(), ask(), ask(), ask(), ask(), ask(), ask(), ask(), ask(), ask(), ask(), ask()];
  if (index < 20) {
    const quiz = document.querySelector(".question");
    quiz.innerText = questions[index].question;
    document.addEventListener("keyup", (event) => {
      console.log(event.key);
      console.log(Number.isInteger(parseInt(event.key)));
      if (event.key == questions[index].answer) {
        moveForward(1);
        displayQuestion(index + 1);
      } else if (parseInt(event.key)) {
        moveForward(2);
        displayQuestion(index + 1);
      } else {
        displayQuestion(index);
      }
    }, { once: true });
  }
};

export { displayQuestion, moveForward, ask }
