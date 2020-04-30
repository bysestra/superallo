import { current, request } from 'helpers'
import { Device } from 'lib/twilio'
import Turbolinks from 'turbolinks'

export default class extends ApplicationController {
  static targets = [ 'phoneNumber' ]

  initialize() {
    Device.on('ready', (device) => { this.classList.add('call--ready') })
    Device.on('connect', this.startCall.bind(this))
    Device.on('disconnect', this.endCall.bind(this))

    this.getCapabilityToken().then((token) => {
      Device.setup(token, {
        codecPreferences: ['pcmu', 'opus'],
        debug: true,
        closeProtection: true,
        fakeLocalDTMF: true
      })
    }).then(() => {
      this.dial()
    })
  }

  // Actions

  dial() {
    const id = this.data.get('id')

    // TODO: Check for format, or disable input change.
    if (this.phoneNumber.length && id) {
      this.currentConnection = Device.connect({ id })
    }
  }

  hangup() {
    this.currentConnection.disconnect()
  }

  // Private

  async getCapabilityToken() {
    this.abortController = new AbortController
    const { signal } = this.abortController

    try {
      return await request.post(this.buildCapabilityURL, { signal })
    } catch (error) {
      if (error.name != "AbortError") throw error
    }
  }

  async updateCall(attributes) {
    this.abortController = new AbortController
    const { signal } = this.abortController

    const formData = new FormData()
    Object.keys(attributes).forEach(key => formData.set(`call[${key}]`, attributes[key]))

    try {
      return await request.put(this.data.get('url'), { body: formData, signal })
    } catch (error) {
      if (error.name != "AbortError") throw error
    }
  }

  get buildCapabilityURL() {
    const url = new URL(current.twilio.capabilityUrl)
    url.searchParams.set("page", window.location.pathname)
    return url
  }

  get phoneNumber() {
    return this.phoneNumberTarget.value
  }

  startCall() {
    this.dispatch('start-timer')
    this.classList.add('call--started')
  }

  endCall({ parameters: { CallSid } }) {
    this.dispatch('stop-timer')

    this.updateCall({ 'status': 'completed', 'external_id': CallSid }).then(() => {
      if (this.classList.contains('call--started')) {
        this.classList.remove('call--started')
      }
    }).then(() => {
      Turbolinks.visit(window.location.href)
    })
  }
}
