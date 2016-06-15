module basics

function main = |args| {

  let addOne = |n| -> n + 1
  let multiplyByFive = |n| -> n * 5

  let compose = |f, g| {
    return |x| {
      return f(g(x))
    }
  }

  let compute1 = compose(multiplyByFive, addOne) # 50
  let compute2 = compose(addOne, multiplyByFive) # 42

  println(compute1(1))
  println(compute2(1))

}