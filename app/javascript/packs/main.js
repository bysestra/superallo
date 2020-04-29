require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/actiontext")
require("@rails/activestorage").start()
require("channels")
require("local-time").start()
require("trix")
require("application")
require("bootstrap/dist/js/bootstrap")

window.Rails = Rails

import 'bootstrap'
import 'data-confirm-modal'

$(document).on("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})
