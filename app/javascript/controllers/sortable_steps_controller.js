import Sortable from "sortablejs"

const list = document.querySelector("#steps")

const initSortable = () => {
  Sortable.create(list, {
    ghostClass: "ghost",
    animation: 150,
    onEnd: (event) => {
      alert(`${event.oldIndex} moved to ${event.newIndex}`)
    }
  })
}

export { initSortable }
