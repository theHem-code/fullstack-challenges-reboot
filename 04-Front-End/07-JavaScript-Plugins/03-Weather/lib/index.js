// TODO: Write your JS code in here
import { initSelect2 } from "./plugins/init_select2";
import { fetchWeather, fetchWeatherByCoordinates } from "./weather";

// initialize plugins
initSelect2();

// AJAX call
fetchWeather("berlin");

// Eventlisteners

const form = document.querySelector("#city-form");
const input = document.querySelector("#city-input");

form.addEventListener("submit", (event) => {
    event.preventDefault();
    fetchWeather(input.value);
});


const current = document.querySelector("#currentBtn");
current.addEventListener("click", (event) => {
  navigator.geolocation.getCurrentPosition((data) => {
    fetchWeatherByCoordinates(data);
  });
});
