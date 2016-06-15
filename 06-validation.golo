module maybeOrNot

import stools

function getMonthName = |mo| {
  let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
      "Aug", "Sep", "Oct", "Nov", "Dec"]
  try {
    return months: get(mo - 1)
  } catch(err) {
    raise("Invalid Month Number")
  }
}

function getDayName = |da| {
  let days = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
  try {
    return days: get(da - 1)
  } catch(err) {
    raise("Invalid Day Number")
  }
}


function main = |args| {

  let checkMonth = |monthNumber| {
    try {
      return Validation(): success(getMonthName(monthNumber))
    } catch (e) {
      return Validation(): fail(vector[e: message()])
    }
  }

  let checkDay = |dayNumber| {
    try {
      return Validation(): success(getDayName(dayNumber))
    } catch (e) {
      return Validation(): fail(vector[e: message()])
    }
  }

  checkMonth(12): cata(
    failureFn = |err| -> println(err),
    successFn = |value| -> println(value)
  )

  checkMonth(42): cata(
    failureFn = |err| -> println(err),
    successFn = |value| -> println(value)
  )


  Validation(): success(
    |day| -> 
      |month| -> 
        "Day:" + day + " Month:" + month
  )
    : ap(checkDay(1))
    : ap(checkMonth(12))
    : cata(
      failureFn = |err| -> println(err),
      successFn = |value| -> println(value)
    )



}