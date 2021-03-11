@val external document: {..} = "document"
@val external window: {..} = "window"
let plusButton = document["getElementById"]("plus-one")
let minusButton = document["getElementById"]("minus-one")
let countElement = document["getElementById"]("count")
let count = ref(0)

let renderCountTextView = (): unit => {
  let n = count.contents
  countElement["innerText"] = {
    if n === 0 {
      `Count is zero`
    } else {
      `Count is ${Belt.Int.toString(n)}`
    }
  }
}

let updateCount = steps => {
  count := count.contents + steps
}

let updateCountClass = () => {
  let n = count.contents
  countElement["className"] =
    "count" ++ {
      if n > 0 {
        " count-positive"
      } else if n < 0 {
        " count-negative"
      } else {
        " count-zero"
      }
    }
}

let renderView = steps => {
  updateCount(steps)
  renderCountTextView()
  updateCountClass()
}

let minusOne = () => {
  renderView(-1)
}

let plusOne = () => {
  renderView(1)
}

plusButton["addEventListener"]("click", plusOne)
minusButton["addEventListener"]("click", minusOne)
