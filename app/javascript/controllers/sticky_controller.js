import stickybits from 'stickybits'

export default class extends ApplicationController {
  connect() {
    stickybits(this.element, { stickyBitStickyOffset: '100', useStickyClasses: true })
  }
}
