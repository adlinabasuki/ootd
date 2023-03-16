import { Controller } from "@hotwired/stimulus"
// import hehe from "../images/hehe.png";

// Connects to data-controller="loading-page"
export default class extends Controller {
  connect() {
    console.log(this.element);
  }

  load(e) {
    e.preventDefault();
    const template = `
    <div class="loader" id="loading-screen">
      <div class="loader__bar"></div>
      <div class="loader__bar loader__bar--delay-1"></div>
      <div class="loader__bar loader__bar--delay-2"></div>
      <div class="loader__bar loader__bar--delay-3"></div>
      <div class="loader__bar loader__bar--delay-4"></div>
      <div class="loader__bar loader__bar--delay-5"></div>
      <img src="http://res.cloudinary.com/dvxuommm8/image/upload/v1678957138/fc5oem8ctjiibgxsjovk.png"
    </div>
    `;
    document.body.insertAdjacentHTML("beforeend", template);
    setTimeout(() => {
      this.element.submit();
    }, 3000);
  }
}
