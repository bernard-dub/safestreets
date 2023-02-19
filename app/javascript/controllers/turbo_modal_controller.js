import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  connect() {
	  console.log("hello from turbo-modal")
  }
  
  submitEnd(event) {
	  if (event.detail.success) {
	  	this.element.remove()
	  }
  }
}
