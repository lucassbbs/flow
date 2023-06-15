import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    console.log("estou aqui")
    new Typed(this.element, {
      strings: ["Agências de Marketing", "Eugências", "Startups", "Agência de Eventos"],
      typeSpeed: 100,
      loop: true
    })
  }
}
