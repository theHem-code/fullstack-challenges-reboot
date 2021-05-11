const APIkey = "da16cd9e663161af25ed77328fbd62ac";
const city = document.querySelector("#city");
const date = document.querySelector("#date");
const description = document.querySelector("#description");
const temp = document.querySelector("#temp");

const fetchWeather = (cityName) => {
  fetch(
    `https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${APIkey}`
  )
    .then((response) => response.json())
    .then((data) => {
      city.innerText = data.name;
      // to get the date in the right format and from the location I requested
      const today = new Date();
      const localOffset = data.timezone + today.getTimezoneOffset() * 60; // returns the timezone difference from current locale and UTC
      const localDate = new Date(today.setUTCSeconds(localOffset)); // creats the date & time from the location I am searching for depending on the API
      const options = {
        weekday: "long",
        month: "long",
        day: "numeric",
        hour: "numeric",
        minute: "numeric",
      };
      const formattedDate = localDate.toLocaleDateString("en-US", options); //changes the time format I need with the options I can define
      date.innerText = formattedDate;

      icon.src = `https://openweathermap.org/img/w/${data.weather[0].icon}.png`; // changing the value of src in the image tag
      temp.innerText = `${Math.round(data.main.temp) - 273}°C`;
      description.innerText = data.weather[0].description;
    });
};

const fetchWeatherByCoordinates = (data) => {
  fetch(
    `https://api.openweathermap.org/data/2.5/weather?lat=${data.coords.latitude}&lon=${data.coords.longitude}&appid=${APIkey}`
  )
    .then((response) => response.json())
    .then((data) => {
      console.log(data.name);
      fetchWeather(data.name);
    });
};

export { fetchWeather, fetchWeatherByCoordinates };
