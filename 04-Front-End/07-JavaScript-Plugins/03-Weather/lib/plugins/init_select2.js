import $ from "jquery";
import "select2";

const initSelect2 = () => {
  const cities = [
    "Amsterdam",
    "Bali",
    "Barcelona",
    "Belo Horizonte",
    "Berlin",
    "Bordeaux",
    "Brussels",
    "Buenos Aires",
    "Casablanca",
    "Chengdu",
    "Copenhagen",
    "Kyoto",
    "Lausanne",
    "Lille",
    "Lisbon",
    "London",
    "Lyon",
    "Madrid",
    "Marseille",
    "Melbourne",
    "Mexico",
    "Milan",
    "Montréal",
    "Nantes",
    "Oslo",
    "Paris",
    "Rio de Janeiro",
    "Rennes",
    "Rome",
    "São Paulo",
    "Seoul",
    "Shanghai",
    "Shenzhen",
    "Singapore",
    "Stockholm",
    "Tel Aviv",
    "Tokyo",
  ];

  $("#city-input").select2({ data: cities, width: "100%" });
};

export { initSelect2 };
