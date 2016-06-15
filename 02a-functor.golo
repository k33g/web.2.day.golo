module functors

import stools

function main = |args| {

  let panda = Functor(): of("🐼")

  let addLapinouBuddy = |me| -> me + "🐰"
  let addCatBuddy = |me| -> me + "🐱"

  let buddies = panda: map(addLapinouBuddy)

  println(buddies: value())


  println(
    buddies
      : map(addCatBuddy)
      : map(addLapinouBuddy)
      : value()
  )
}