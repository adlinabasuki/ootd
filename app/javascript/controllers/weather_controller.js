import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather"
export default class extends Controller {
  static targets = ["temp", "city", "icon", "desc"]

  static values = {
    apiKey: String
  }

  connect() {

    navigator.geolocation.getCurrentPosition((position) => {
      const { latitude, longitude } = position.coords;

      // const weatherField = document.querySelector(".weather-temp")
      // const iconField = document.getElementById("weather-icon")
      // const descriptionField = document.querySelector(".weather-descr")
      const url = `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&units=metric&APPID=3383dc5d38c97be1b56c31e88567f2e7`;

      // const weatherField = document.querySelector(".weather-temp")
      // const iconField = document.getElementById("weather-icon")
      // const descriptionField = document.querySelector(".weather-descr")
      // const url = `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&units=metric&appid=${this.apiKeyValue}`;

      fetch(url)
        .then(response => response.json())
        .then((data) => {
          // const iconId = data.weather[0].icon;
          // iconField.src = `https://openweathermap.org/img/w/${iconId}.png`;
          // descriptionField.value = data.weather[0].main;
          // weatherField.value = data.main.temp;
          const desc = data.weather[0].main
          // const desc = "Sunny"
          this.tempTarget.innerText = `${Math.round(data.main.temp)}°`;
          this.descTarget.innerText = desc;
          this.cityTarget.innerText = data.name;
          console.log(desc);

          if(desc === 'Clouds') {
            this.iconTarget.classList.add('wi-cloudy');
          }
          else if (desc === "Sunny") {
            this.iconTarget.classList.add('wi-day-sunny');
          }
          else if (desc === "Clear") {
            this.iconTarget.classList.add('wi-day-sunny');
          }
          else if (desc === "Thunderstorm") {
            this.iconTarget.classList.add('wi-thunderstorm');
          }
          else if (desc === "Drizzle") {
            this.iconTarget.classList.add('wi-day-sunny');
          }
          else if (desc === "Rain") {
            this.iconTarget.classList.add('wi-rain');
          }
          else if (desc === "Snow") {
            this.iconTarget.classList.add('wi-snow');
          }
          else if (desc === "Atmosphere") {
            this.iconTarget.classList.add('wi-day-sunny');
          }
        })
    })
  }
}
