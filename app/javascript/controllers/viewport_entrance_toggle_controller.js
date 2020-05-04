export default class extends ApplicationController {
  initialize() {
    this.intersectionObserver = new IntersectionObserver(entries => this.processIntersectionEntries(entries))
  }

  connect() {
    this.intersectionObserver.observe(this.element)
  }

  disconnect() {
    this.intersectionObserver.unobserve(this.element)
  }

  // Private
  processIntersectionEntries(entries) {
    entries.forEach(entry => {
      this.classList.toggle(this.data.get('class'), entry.isIntersecting)
      document.body.classList.toggle(this.data.get('bodyClass'), !entry.isIntersecting)
    })
  }
}
