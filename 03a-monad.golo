module functors

import stools

function main = |args| {
  let panda = Functor(): of("🐼")
  let addTigrouBuddy = |me| -> Functor(): of(me + "🐯")

  let buddies = panda: map(addTigrouBuddy)

  println(buddies: value())
  println(buddies: value(): value())

}