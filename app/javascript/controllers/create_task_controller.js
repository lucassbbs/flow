import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-task"
export default class extends Controller {

  static targets = ['inputDiv']

  connect() {
  }

  styleStep(){
    const stepInput = this.stepInputTarget;
    const selectedOption = selectStep.selectedOptions[0].value;
    if(Array.from(stepDiv.classList).filter(name => name.includes('task-main-card__step--'))){
      const stepCollorClass =Array.from(stepDiv.classList).filter(name => name.includes('task-main-card__step--'))
      stepDiv.classList.remove(stepCollorClass);
    }
    const selectedOptionCorrected = selectedOption.replace(' ','-').replace('ç','c').replace('í','i').replace('ã','a');
    const stepNewClass = `task-main-card__step--${selectedOptionCorrected}`;
    stepDiv.classList.add(stepNewClass);
  }
}
