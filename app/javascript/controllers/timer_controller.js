import Timer from 'easytimer.js'

export default class extends ApplicationController {
  static targets = [ 'container' ]

  initialize() {
    this.timer = new Timer()

    this.element.addEventListener('call:start-timer', this.start.bind(this))
    this.element.addEventListener('call:stop-timer', this.stop.bind(this))
  }

  start() {
    this.timer.start()
    this.timer.addEventListener('secondsUpdated', () => {
      this.containerTarget.innerHTML = this.timer.getTimeValues().toString()
    })
  }

  stop() {
    this.timer.stop()
  }

  reset() {
    this.timer.reset()
  }
}
