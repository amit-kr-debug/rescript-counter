@val external document: {..} = "document"
@val external window: {..} = "window"
let plusButton = document["getElementById"]("plus-one")
let minusButton = document["getElementById"]("minus-one")
let el = document["getElementById"]("count")
window["count"] = 0

let renderCountTextView = count => {
  el["innerText"] = {
    if count === 0 {
      `Count is zero`
    } else {
      `Count is ${Belt.Int.toString(count)}`
    }
  }
}

let updateCount = steps => {
  window["count"] = steps + window["count"]
}

let updateCountClass = count => {
  el["className"] =
    "count" ++ {
      if count > 0 {
        " count-positive"
      } else if count < 0 {
        " count-negative"
      } else {
        " count-zero"
      }
    }
}

let renderView = steps => {
  updateCount(steps)
  renderCountTextView(window["count"])
  updateCountClass(window["count"])
}

let minusOne = () => {
  renderView(-1)
}

let plusOne = () => {
  renderView(1)
}

plusButton["addEventListener"]("click", plusOne)
minusButton["addEventListener"]("click", minusOne)
