import Sortable from "sortablejs"

const list = document.querySelectorAll(".test")
console.log(list)

const initSortable = () => {
  list.forEach((itemList) => {
    console.log(itemList)
    new Sortable(itemList, {
      ghostClass: "ghost",
      animation: 150,
      filter: '.filtered',
      group: "shared",
      onEnd: (event) => {
        const task = document.querySelector(".card-task")
        console.log("Oi")
        const taskId = task.dataset.taskId
        console.log(event.to.dataset.filter)
        const url = `/tasks/${taskId}`
        const csrfToken = document.head.querySelector("[name='csrf-token']").content;
        fetch(url,{
          method:"PATCH",
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'X-Requested-With': 'XMLHttpRequest',
            'X-CSRF-Token': csrfToken
          },
          body: JSON.stringify({task: {step: event.to.dataset.filter}})
        })
        /*.then(response => response.json())
        .then((data)=>{
          console.log(data)
        })*/
      }
    })
  })
}

export { initSortable }
