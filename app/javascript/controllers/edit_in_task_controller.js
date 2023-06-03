import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-in-task"
export default class extends Controller {

  static targets = ['clientDiv','titleDiv','clients', 'descriptionDiv','deadlineDiv',
                    'responsibles','responsibleDiv','statusDiv']

  connect() {
    console.log('entrou');
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
  editResponsible() {
    const a = this.responsiblesTarget.innerHTML;
    const responsiblesArray = a.slice(1,-1).replaceAll('"','').split(', ');
    const responsibleDiv = this.responsibleDivTarget
    if (!responsibleDiv.classList.contains('input-active')) {
      const responsibleName = responsibleDiv.innerHTML;
      responsibleDiv.innerHTML = '';
      const node = document.createElement("select");
      node.classList.add("task-main-card__input-text");
      node.value = responsibleName;
      node.setAttribute('id', 'task_user')
      node.setAttribute('name', 'task[user]')
      responsiblesArray.forEach(responsible => {
        let responsibleNode = document.createElement("option");
        responsibleNode.value = responsible;
        responsibleNode.innerHTML = responsible.replace('_',' ');
        node.classList.add('task-main-card__input');
        node.appendChild(responsibleNode);

      });
      responsibleDiv.appendChild(node);
      responsibleDiv.classList.add("input-active");
    }
    this.showButtons();
  }

  editStatus() {
    const statussArray = ['solicitado','aprovado','concluído','em andamento','em aprovação','pendente','refação'];
    const statusDiv = this.statusDivTarget
    if (!statusDiv.classList.contains('input-active')) {
      const statusName = statusDiv.innerHTML;
      statusDiv.innerHTML = '';
      const node = document.createElement("select");
      node.classList.add("task-main-card__input-select-status");
      node.value = statusName;
      node.setAttribute('id', 'task_user')
      node.setAttribute('name', 'task[user]')
      statussArray.forEach(status => {
        let statusNode = document.createElement("option");
        statusNode.value = status;
        statusNode.innerHTML = status;
        node.classList.add('task-main-card__input');
        node.appendChild(statusNode);

      });
      statusDiv.appendChild(node);
      statusDiv.classList.add("input-active");
    }
    this.showButtons();
  }



}
