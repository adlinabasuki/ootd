import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

export default class extends Controller {
  connect() {
    let settings = {
      hidePlaceholder: true
    }
    const tom = new TomSelect(this.element, settings)
  }
}
