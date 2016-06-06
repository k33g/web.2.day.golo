module basics

function main = |args| {

  let addition = |a,b| -> a + b

  # currying addition
  let add = |a| -> |b| -> a + b

  add(40)(2)

  let incrementBy1 = add(1)
  let incrementBy2 = add(2)

  incrementBy1(41) # 42

  let arr1 = [100, 200, 300, 400, 500]

  arr1: map(|x| -> x + 1) # [101, 201, 301, 401, 501]

  arr1: map(incrementBy1) # [101, 201, 301, 401, 501]


  let compose2 = |f, g| {
    return |x| {
      return f(g(x))
    }
  }

  # |f, g| -> |x| -> f(g(x))

  let compose2 = |f, g, h| {
    return |x| {
      return f(g(h(x)))
    }
  }

}