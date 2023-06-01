import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-in-task"
export default class extends Controller {

  static targets = ['clientDiv','titleDiv','clients']

  connect() {
    console.log('entrou');
    //console.log(this.clientDivTarget);
  }

  editClient() {
    console.log('clicou');
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
      clientsArray.forEach(client => {
        let clientNode = document.createElement("option");
        clientNode.value = client;
        clientNode.innerHTML = client;
        node.appendChild(clientNode);

      });
      clientDiv.appendChild(node);
      clientDiv.classList.add("input-active")
    }
  }

  editTitle() {
    console.log('clicou');
    const titleDiv = this.titleDivTarget
    if (!titleDiv.classList.contains('input-active')) {
      const titleName = titleDiv.innerHTML;
      titleDiv.innerHTML = '';
      const node = document.createElement("input");
      node.classList.add("task-main-card__input-text");
      node.value = titleName;
      node.setAttribute('id', 'task_title')
      node.setAttribute('name', 'task[title]')
      titleDiv.appendChild(node);
      titleDiv.classList.add("input-active")
    }
  }
}
