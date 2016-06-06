module funcGolo

import gololang.Errors

@option
function toInt = |value| -> java.lang.Integer.parseInt(value)

@result
function toIntBis = |value| -> java.lang.Integer.parseInt(value)


function main = |args| {

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