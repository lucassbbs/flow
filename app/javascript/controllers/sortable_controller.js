import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    this.variable = this.element.querySelector(".card-task").dataset.sortableUrlValue
    this.containerTargets.forEach((cont) => {
      Sortable.create(cont, {
        animation: 150,
        group: "shared",
        handle: ".handle",
        filter: '.filtered',
        onEnd: (event) => {
          let url = event.originalEvent.dataTransfer.getData("application/drag-key")
          const csrfToken = document.head.querySelector("[name='csrf-token']").content;

          fetch(url, {
            method:"PATCH",
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'X-Requested-With': 'XMLHttpRequest',
              'X-CSRF-Token': csrfToken
            },
            body: JSON.stringify({task: {step: event.to.dataset.filter}})
          })
        }
      })
    })
  }

  dragstart(event) {
    event.dataTransfer.setData("application/drag-key", event.currentTarget.dataset.url)
  }

  dragover(event) {
    event.preventDefault()
  }

  dragenter(event) {
    event.preventDefault()
  }

  drop(event) {
    event.preventDefault()
  }
  dragend(event) {
    event.preventDefault()
  }
}
