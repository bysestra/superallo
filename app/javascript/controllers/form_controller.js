import "form-request-submit-polyfill"

export default class extends ApplicationController {
  submit(event) {
    const form = event.target.form || event.target.closest("form")
    if (form) form.requestSubmit()
  }
}
