// TODO: Autocomplete the input with AJAX calls.

const search = document.getElementById("search");
const results = document.getElementById("results");

const wordSuggestions = (keyword) => {
  const url = `https://wagon-dictionary.herokuapp.com/autocomplete/${keyword}`;

  fetch(url)
    .then((response) => response.json())
    .then((data) => {
      data.words.forEach((word) => {
        const wordList = `<li>
            <p><i class="fas fa-search"></i>${word}</p>
            </li>`;
        results.insertAdjacentHTML("beforeend", wordList);
      });
    });
};

search.addEventListener("keyup", (event) => {
  event.preventDefault();
  const search = document.getElementById("search");
  results.innerHTML = "";
  wordSuggestions(search.value);
});
