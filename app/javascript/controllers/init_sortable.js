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
      onEnd: function () {
        console.log("Oi")
      }
    })
  })
}


export { initSortable }
