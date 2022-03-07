import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "dropdown" ]

  connect() {
    console.log('Hi')
  }

  toggleSubstitutes() {
    this.dropdownTarget.classList.toggle('dropdown-show')
  }
}
