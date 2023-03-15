import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather"
export default class extends Controller {
  static targets = ["temp", "city"]

  connect() {
    navigator.geolocation.getCurrentPosition((position) => {
      const { latitude, longitude } = position.coords;
      const weatherField = document.querySelector(".weather-temp")
      const iconField = document.getElementById("weather-icon")
      const descriptionField = document.querySelector(".weather-descr")
      const url = `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&units=metric&APPID=3383dc5d38c97be1b56c31e88567f2e7`;
      fetch(url)
        .then(response => response.json())
        .then((data) => {
          const iconId = data.weather[0].icon;
          iconField.src = `https://openweathermap.org/img/w/${iconId}.png`;
          descriptionField.value = data.weather[0].main;
          this.tempTarget.textContent = data.main.temp;
          weatherField.value = data.main.temp;
          this.cityTarget.textContent = data.name;
        })
    })
  }
}