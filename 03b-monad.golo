module monads

import stools

function main = |args| {
  let panda = Monad(): of("🐼")
  let addTigrouBuddy = |me| -> Monad(): of(me + "🐯")


  let buddies = panda: fmap(addTigrouBuddy)

  println(buddies: value())

  println(
    panda
      : fmap(addTigrouBuddy)
      : fmap(addTigrouBuddy)
      : fmap(addTigrouBuddy)
      : fmap(addTigrouBuddy)
      : value()
  )

}