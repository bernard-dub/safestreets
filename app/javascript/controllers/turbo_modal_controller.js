import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  connect() {
	  
  }
  
  submitEnd(event) {
	  if (event.detail.success) {
	  	this.element.remove()
	  }
  }
  
  hideModal() {
	  this.element.remove()
    }
}
