import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="index-filter"
export default class extends Controller {
  static targets = ["form", "occasion", "type", "laundry", "grid"]

  connect() {
    console.log(this.formTarget);
  }

  update() {
    console.log("We have reached update");
    const url = `${this.formTarget.action}?occasion=${this.occasionTarget.value}&type=${this.typeTarget.value}&laundry=${this.laundryTarget.value}`
    console.log(url);
    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      console.log(data);
    })
  }
}
