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

  let checkMonthAndDay = |monthNumber, dayNumber| {
    try {
      let month = getMonthName(monthNumber)
      let day = getDayName(dayNumber)
      return Either(): right([month, day])
    } catch (e) {
      return Either(): left(e: message())
    }
  }

  # les println c'est mal
  checkMonthAndDay(42, 42): cata(
    leftFn = |err| -> println(err),
    rightFn = |value| -> println(value)
  )
}