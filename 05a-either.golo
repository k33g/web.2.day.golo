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

  println( getMonthName(1) )
  println( getMonthName(42) )
  println( getDayName(5) )

}