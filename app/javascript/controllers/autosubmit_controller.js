import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autosubmit"
export default class extends Controller {
  static targets = ["submitbutton"]
  connect() {
    this.submitbuttonTarget.hidden = true;

    const create = document.querySelector('#create');
    const confirm = document.querySelector('#confirm');

    create.textContent = confirm.textContent;

    create.addEventListener('click', () => {
      create.style['display'] = 'none';
      confirm.textContent = "Confirm";
      confirm.style['display'] = 'block';
    })
  }

  submit() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.submitbuttonTarget.click()
    }, 500)
  }
}
