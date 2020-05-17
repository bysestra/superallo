export default class extends ApplicationController {
  // Actions
  toggleClass() {
    this.container.classList.toggle(this.data.get('class'))
  }

  get container() {
    if (this.data.has('container')) {
      return document.querySelector(this.data.get('container'))
    } else {
      return this.element
    }
  }
}
