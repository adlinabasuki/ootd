import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather"
export default class extends Controller {
  static targets = ["temp", "city", "icon", "desc"]

  static values = {
    apiKey: String
  }

  connect() {
    navigator.geolocation.getCurrentPosition(position => this.#fetchWeather(position.coords.latitude, position.coords.longitude), async (error) => {
      const coordinates = await this.#findLocationByIp()
      await this.#fetchWeather(coordinates.lat, coordinates.lng)
    })
  }


  async #findLocationByIp() {
    const dataIp = await (await fetch("https://api.ipify.org/?format=json")).json()
    const data = await (await fetch(`https://geo.ipify.org/api/v2/country,city?apiKey=at_VR1Gd5HkPSKiVVq34zXzPPoLjTgg1&ipAddress=${dataIp.ip}`)).json()
    console.log(data)
    const {lat, lng} = data.location
    return {lat, lng}
  }

  async #fetchWeather(lat, lng) {
    console.log("banana")
    const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lng}&units=metric&appid=${this.apiKeyValue}`;
    const data = await (await fetch(url)).json()
    console.log("fetching", lat, lng);
    console.log("data", data)
    const desc = data.weather[0].main
    console.log("weatherData", data)
    this.tempTarget.innerText = `banana${Math.round(data.main.temp)}°`;
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
  }
}
