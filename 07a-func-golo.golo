module funcGolo

import gololang.Errors

function main = |args| {
  let toInt = |value| {
    try {
      return Some(java.lang.Integer.parseInt(value))
    } catch(e) {
      return None()
    }
  }

  let result = toInt("42"): either(|value| {
    println("Succeed!")
    return value
  }, {
    println("Failed!")
    return 42
  })

  let result2 = toInt("Quarente-deux"): map(|value| {
    println("Succeed!")
    return value
  }): orElse(42) #  valeur par défaut

  let result3 = toInt("Quarante-deux"): map(|value| {
    println("Succeed!")
    return value
  }): orElseGet({
    println("Failed!")
    return 42
  })

  let toIntBis = |value| {
    try {
      return Result(java.lang.Integer.parseInt(value))
    } catch(e) {
      return Error(e: getMessage())
    }
  }

  let result4 = toIntBis("Quarante-deux"): either(
    mapping=|value| {
      println("Succeed!")
      return value
    },
    default=|err| {
      println("Failed!" + err)
      return 42
    })

}