import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autosubmit"
export default class extends Controller {
  static targets = ["submitbutton"]
  connect() {}

  submit() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.submitbuttonTarget.click()
    }, 500)
  }
}
