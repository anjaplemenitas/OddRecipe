import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["cnext", "next1", "next2", "cprev", "prev1", "prev2"]

  next() {
    this.next1Target.click()
    this.next2Target.click()
  }

  prev() {
    this.prev1Target.click()
    this.prev2Target.click()
  }
}
