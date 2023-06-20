import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-in-task"
export default class extends Controller {

  static targets = ['clientDiv','titleDiv','clients', 'descriptionDiv','deadlineDiv',
                    'responsibles','responsibleDiv','statusDiv','archivedInput',
                  'stepDiv','steps']

  connect() {
    console.log('entrou');
    const steps = JSON.parse(this.stepsTarget.innerHTML);
    console.log(steps);
    //console.log(this.clientDivTarget);
  }

  showButtons = () => {
    const submitDiv = document.getElementsByClassName("task-main-card__submit-div")[0];
    if (submitDiv.classList.contains('hidden')){
      submitDiv.classList.remove('hidden');
    }
  }

  editClient() {
    const a = this.clientsTarget.innerHTML;
    const clientsArray = a.slice(1,-1).replaceAll('"','').split(', ');
    const clientDiv = this.clientDivTarget
    if (!clientDiv.classList.contains('input-active')) {
      const clientName = clientDiv.innerHTML;
      clientDiv.innerHTML = '';
      const node = document.createElement("select");
      node.classList.add("task-main-card__input-text");
      node.value = clientName;
      node.setAttribute('id', 'task_client')
      node.setAttribute('name', 'task[client]')
      node.classList.add('task-main-card__input');
      clientsArray.forEach(client => {
        let clientNode = document.createElement("option");
        clientNode.value = client;
        clientNode.innerHTML = client;
        node.appendChild(clientNode);

      });
      clientDiv.appendChild(node);
      clientDiv.classList.add("input-active")
    }
    this.showButtons();
  }

  editTitle() {
    const titleDiv = this.titleDivTarget
    if (!titleDiv.classList.contains('input-active')) {
      const titleName = titleDiv.innerHTML;
      titleDiv.innerHTML = '';
      const node = document.createElement("textarea");
      node.classList.add("task-main-card__input-text");
      node.value = titleName;
      node.setAttribute('id', 'task_title')
      node.setAttribute('name', 'task[title]')
      node.classList.add('task-main-card__input');
      titleDiv.appendChild(node);
      titleDiv.classList.add("input-active")
    }
    this.showButtons();
  }

  editDescription() {
    const descriptionDiv = this.descriptionDivTarget
    if (!descriptionDiv.classList.contains('input-active')) {
      const descriptionName = descriptionDiv.innerHTML;
      descriptionDiv.innerHTML = '';
      const node = document.createElement("textarea");
      node.classList.add("task-main-card__input-text");
      node.value = descriptionName;
      node.setAttribute('id', 'task_description');
      node.setAttribute('name', 'task[description]')
      node.classList.add('task-main-card__input');
      descriptionDiv.appendChild(node);
      descriptionDiv.classList.add("input-active")
    }
    this.showButtons();
  }

  editDeadline() {
    const deadlineDiv = this.deadlineDivTarget
    if (!deadlineDiv.classList.contains('input-active')) {
      const deadlineName = deadlineDiv.innerHTML;
      deadlineDiv.innerHTML = '';
      const node = document.createElement("input");
      node.classList.add("task-main-card__input-text");
      node.value = deadlineName;
      node.setAttribute('id', 'task_deadline');
      node.setAttribute('type', 'date');
      node.setAttribute('name', 'task[deadline]');
      node.classList.add('task-main-card__input');
      deadlineDiv.appendChild(node);
      deadlineDiv.classList.add("input-active")
    }
    this.showButtons();
  }

  editStatus() {
    const statussArray = ['solicitado','aprovado','concluído','em andamento','em aprovação','pendente','refação'];
    const statusDiv = this.statusDivTarget
    if (!statusDiv.classList.contains('input-active')) {
      const statusName = statusDiv.innerText;
      statusDiv.innerText = '';
      const node = document.createElement("select");
      node.classList.add("task-main-card__input-select-status");
      node.classList.add("task-main-card__input");
      node.value = statusName;
      node.setAttribute('data-action','change->edit-in-task#styleStatus')
      node.setAttribute('id', 'task_status')
      node.setAttribute('name', 'task[status]')
      statussArray.forEach(status => {
        let statusNode = document.createElement("option");
        statusNode.value = status;
        statusNode.innerHTML = status.toUpperCase();
        statusNode.classList.add('task-main-card__input');
        statusNode.classList.add('task-main-card__input-option-status');
        node.appendChild(statusNode);
        node.value = statusName.toLowerCase();
      });
      statusDiv.appendChild(node);
      statusDiv.classList.add("input-active");
    }
    this.showButtons();
  }

  styleStatus(){
    const statusDiv = this.statusDivTarget;
    const selectStatus = statusDiv.firstChild;
    const selectedOption = selectStatus.selectedOptions[0].value;
    const statusCollorClass =Array.from(statusDiv.classList).filter(name => name.includes('task-main-card__status--'))
    statusDiv.classList.remove(statusCollorClass);
    const selectedOptionCorrected = selectedOption.replace(' ','-').replace('ç','c').replace('í','i').replace('ã','a');
    const statusNewClass = `task-main-card__status--${selectedOptionCorrected}`;
    statusDiv.classList.add(statusNewClass);

    console.log();
  }

  editArchived(){
    this.showButtons();
  }

  editStep() {
    const steps = JSON.parse(this.stepsTarget.innerHTML)
    const stepDiv = this.stepDivTarget;
    if (!stepDiv.classList.contains('input-active')) {
      const stepName = stepDiv.innerText;
      //const stepName = stepDiv.innerHTML;
      stepDiv.innerText = '';
      const node = document.createElement("select");
      node.classList.add("task-main-card__input-select-step");
      node.classList.add("task-main-card__input");
      const nodeValue = steps.filter(step => step.name == stepName)[0].id;
      node.value = nodeValue;
      console.log(nodeValue);
      console.log(node);
      node.setAttribute('data-action','change->edit-in-task#styleStep')
      node.setAttribute('id', 'task_step')
      node.setAttribute('name', 'task[step]')
      steps.forEach(step => {
        let stepNode = document.createElement("option");
        stepNode.value = step.id;
        stepNode.innerHTML = step.name;
        stepNode.classList.add('task-main-card__input');
        stepNode.classList.add('task-main-card__input-option-step');
        node.appendChild(stepNode);

      });
      node.value = nodeValue;
      console.log(stepName);
      stepDiv.appendChild(node);
      stepDiv.classList.add("input-active");
    }
    this.showButtons();
  }

  styleStep(){
    const steps = JSON.parse(this.stepsTarget.innerHTML)
    const users = JSON.parse(this.responsiblesTarget.innerHTML)
    const stepDiv = this.stepDivTarget;
    const responsibleDiv = this.responsibleDivTarget

    const selectStep = stepDiv.firstChild;
    const selectedOptionId = selectStep.selectedOptions[0].value;
    const selectedOption = steps.filter(selectedOption => selectedOption.id == selectedOptionId)[0];
    const color = selectedOption.color;
    stepDiv.style.backgroundColor = color;
    const responsible = users.filter(responsible => responsible.id == selectedOption.user_id)[0];
    console.log(selectedOption.name);
    console.log(responsible);
    responsibleDiv.innerHTML = `${responsible.first_name} ${responsible.last_name}`;
  }



}
