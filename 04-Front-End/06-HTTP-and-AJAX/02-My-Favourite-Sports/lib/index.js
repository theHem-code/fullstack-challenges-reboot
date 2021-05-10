// TODO: write your code here!

const buttons = document.querySelectorAll(".clickable");

const toggleActiveClass = (event) => {
  event.currentTarget.classList.toggle("active");
};

// REFACTOR:
// const toggleActiveOnClick = (button) => {
//   button.addEventListener("click", toggleActiveClass);
// };

// buttons.forEach(toggleActiveOnClick);


buttons.forEach((button) => {
  button.addEventListener("click", toggleActiveClass);
});


// 'classList' returns a live DOMTokenList collection of the class attributes of the element.
// This can then be used to manipulate the class list.

// explanation....
// if visible is set remove it, otherwise add it
// div.classList.toggle("visible");
