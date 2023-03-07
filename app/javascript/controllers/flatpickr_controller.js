import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  static targets = ["visitDate"]

  connect() {
    flatpickr(this.visitDateTarget, {})
  }
}
