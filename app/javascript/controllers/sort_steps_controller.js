import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

// Connects to data-controller="sort-steps"
export default class extends Controller {
  static targets = ['stepsIndex','stepsDiv','buttonsDiv'];

  showButtons = () => {
    const submitDiv = this.buttonsDivTarget;
    if (submitDiv.classList.contains('hidden')){
      submitDiv.classList.remove('hidden');
    }
  }

  connect() {
    const stepsIndex = this.stepsIndexTarget;
    const stepsDiv = this.stepsDivTarget;
    const list = document.querySelector("#steps");
    Sortable.create(list, {
      ghostClass: "ghost",
      animation: 150,
      onEnd: () => {
        const orderArrayHTML = stepsDiv.getElementsByTagName('li');
        let orderArray = [...orderArrayHTML].map(li=>li.value);
        stepsIndex.value = orderArray;
        this.showButtons();
      }
    })
  }
}
