require("jquery-ui/themes/base/datepicker")
require("jquery-ui/ui/widgets/datepicker")

export default class extends ApplicationController {
  static targets = [ "date", "time", "destination" ]

  connect() {
    this.$date.datepicker({
      dateFormat: "dd/mm/yy",
      minDate: 0,
      onSelect: (value, _) => {
        this.destinationTarget.value = value
        this.destinationTarget.dispatchEvent(new Event("change"))
      }
    })
  }

  get $date() {
    return jQuery(this.dateTarget)
  }
}
