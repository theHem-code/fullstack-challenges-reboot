const insertCoordinates = (coordinates) => {
  const mapData = document.querySelector(".coordinates");
  mapData.innerText = `${coordinates.lng}, ${coordinates.lat}`;
};

const injectToMapbox = (coordinates) => {
  mapboxgl.accessToken =
    "pk.eyJ1IjoidGhlaGVtIiwiYSI6ImNrb2p2ajVyMDBhZmsycHFra2JjNTN6MTcifQ.GGtcSPlIdW6qLmnVvLg4sA";
  var map = new mapboxgl.Map({
    container: "map", // container ID
    style: "mapbox://styles/mapbox/streets-v11", // style URL
    center: [`${coordinates.lng}`, `${coordinates.lat}`], // starting position [lng, lat]
    zoom: 15, // starting zoom
  });
  new mapboxgl.Marker()
    .setLngLat([`${coordinates.lng}`, `${coordinates.lat}`])
    .addTo(map);
};

export { insertCoordinates, injectToMapbox };
