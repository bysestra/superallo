import { Controller } from 'stimulus'
import { request } from 'helpers'
import { Device, logger } from 'lib/twilio'

export default class extends Controller {
  static targets = [ 'phoneNumber' ]

  initialize() {
    this.getCapabilityToken().then(() => Device.setup(this.data.get('token'), {
      codecPreferences: ['pcmu', 'opus'],
      debug: true,
      closeProtection: true,
      fakeLocalDTMF: true
    }))

    Device.on('ready', (device) => {
      logger.setLevel('DEBUG')
    })
  }

  // Actions

  performCall() {
    // updateCallStatus(`Calling ${phoneNumber}…`)

    console.log(`Calling ${this.phoneNumber}…`)
    this.currentConnection = Device.connect({
      phoneNumber: this.phoneNumber
    })

    window.connection = this.currentConnection
  }

  // Private

  async getCapabilityToken() {
    this.abortController = new AbortController
    const { signal } = this.abortController

    try {
      this.data.set('token', await request.post(this.buildCapabilityURL, { signal }))
    } catch (error) {
      if (error.name != "AbortError") throw error
    }
  }

  get buildCapabilityURL() {
    const url = new URL(this.data.get('capabilityUrl'))
    url.searchParams.set("page", window.location.pathname)
    return url
  }

  get phoneNumber() {
    return this.phoneNumberTarget.value
  }
}
