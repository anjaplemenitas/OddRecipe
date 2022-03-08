import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "box" ]

  connect() {
    console.log('Hi')
  }

  test() {
    console.log("working")
    console.log(this.boxTarget.value)
    console.log(this.boxTarget)
  }
}
