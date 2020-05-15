require('jquery-ui/themes/base/datepicker')
require('jquery-ui/ui/widgets/datepicker')

export default class extends ApplicationController {
  static targets = [ 'date', 'time', 'destination' ]

  connect() {
    this.$date.datepicker({})
  }

  get $date() {
    return jQuery(this.dateTarget)
  }
}
