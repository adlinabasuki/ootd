import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

// export default class extends Controller {
//   connect() {
//     let settings = {
//       hidePlaceholder: true
//     }
//     const tom = new TomSelect(this.element, settings)
//   }
// }

export default class extends Controller {
  static values = { options: Object }

  connect() {
    let settings = {
      hidePlaceholder: true
    }

    let all_settings = Object.assign({}, this.optionsValue, settings)
    console.log(all_settings)

    new TomSelect(this.element, all_settings)
  }
}
