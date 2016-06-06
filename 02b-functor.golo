module functors

import stools

function main = |args| {

  let addOne = |value| -> value + 1
  let multiplyBy5 = |value| -> value * 5
  let divideByThree = |value| -> value / 3

  let a = Functor(): of(23.2)

  let b = a
    : map(addOne)
    : map(addOne)
    : map(multiplyBy5)
    : map(divideByThree)

  println(b: value())


}