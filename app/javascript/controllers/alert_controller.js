import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {
  connect() {
    console.log("alert controller connected");
  }

  animateAlterIn(){
    setTimeout(() => {
      console.log("This runs after 2 seconds");
    }, 2000)
  }
}
