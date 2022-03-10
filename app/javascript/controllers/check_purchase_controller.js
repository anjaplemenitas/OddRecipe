import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = [ "form", "submit" ]

  connect() {
    // console.log('Hi')
  }

  test(event) {
    // console.log("working")
    // console.log(this.element)
    const url = event.target.getAttribute('data-url')
    console.log(url)
    console.log(this.formTarget)
    console.log(this.submitTarget)

    fetch(url, {
      headers: {
        'Accept': 'application/json',
        "X-CSRF-Token": csrfToken()
      },
      body: new FormData(this.formTarget),
      method: 'PATCH'
    })
      .then(responce => console.log(responce.json))
      // .then(data => console.log(data))
  }
}
