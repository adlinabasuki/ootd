import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather"
export default class extends Controller {
  static targets = ["temp", "city", "icon", "weatherField", "descriptionField"]

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
    console.log("fetching", lat, lng);
    const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lng}&units=metric&appid=${this.apiKeyValue}`;
    const weatherData = await (await fetch(url)).json()
    const iconId = weatherData.weather[0].icon;
    this.iconTarget.src = `https://openweathermap.org/img/w/${iconId}.png`;
    this.descriptionFieldTarget.value = weatherData.weather[0].main;
    this.tempTarget.textContent = weatherData.main.temp;
    this.weatherFieldTarget.value = weatherData.main.temp;
    this.cityTarget.textContent = weatherData.name;
  }
}
