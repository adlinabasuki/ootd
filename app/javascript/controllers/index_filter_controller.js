import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="index-filter"
export default class extends Controller {
  static targets = ["form", "occasion", "type", "laundry", "grid"]

  update() {
    const url = `${this.formTarget.action}?occasion=${this.occasionTarget.value}&type=${this.typeTarget.value}&laundry=${this.laundryTarget.value}`
    console.log(url);
    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      this.gridTarget.outerHTML = data
    })
  }
}
