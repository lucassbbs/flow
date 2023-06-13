import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-task"
export default class extends Controller {

  static targets = ['stepInput','steps']

  connect() {
  }

  styleStep(){
    const steps = JSON.parse(this.stepsTarget.innerHTML);
    const stepInput = this.stepInputTarget;
    const selectedOptionId = stepInput.selectedOptions[0].value;
    const color = steps.filter(selectedOption => selectedOption.id == selectedOptionId)[0].color;
    stepInput.style.backgroundColor = color;

  }
}
