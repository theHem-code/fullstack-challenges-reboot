// TODO: Write your JS code in here
import { insertCoordinates, injectToMapbox } from "./geocode";

const key =
  "pk.eyJ1IjoidGhlaGVtIiwiYSI6ImNrb2p2ajVyMDBhZmsycHFra2JjNTN6MTcifQ.GGtcSPlIdW6qLmnVvLg4sA";

const submit = document.querySelector("#button");

submit.addEventListener("click", (event) => {
  event.preventDefault();

  const input = document.querySelector("#input").value;
  const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${input}.json?access_token=${key}`;

  fetch(url)
    .then((response) => response.json())
    .then((data) => {
      const coordinates = {
        lng: data.features[0].geometry.coordinates[0],
        lat: data.features[0].geometry.coordinates[1],
      };
      console.log(coordinates);
      insertCoordinates(coordinates);
      injectToMapbox(coordinates);
    });
});
