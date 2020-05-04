import { scrollToElement } from '../helpers'

export default class extends ApplicationController {
  initialize() {
    this.highlightable = document.getElementById(location.hash.substr(1))

    if (this.highlightable) {
      scrollToElement(this.highlightable, { block: 'center' }).then(() => {
        this.highlightable.classList.add('highlighted')
      })
    }
  }
}
