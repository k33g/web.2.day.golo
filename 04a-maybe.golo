module maybeOrNot

import stools

function main = |args| {
  let bob = 
    DynamicObject()
      : id("bob")
      : address(
          DynamicObject()
            : email("bob@github.com")
            : country("US")
        )
  # {"address":{"country":"US","email":"bob@github.com"},"id":"bob"}

  let john = 
    DynamicObject()
      : id("john")
      : address(
          DynamicObject()
            : country("US")
        )
  # {"address":{"country":"US"},"id":"john"}

  let jane = 
    DynamicObject()
      : id("jane")
  # {"id":"jane"}

  let buddies = [bob, jane, john]

  let getMailById = |id, buddies| {
    let email =
      buddies: find(|buddy| -> buddy: id(): equals(id))
        : address()
        : email()

    if email is null {
      return "no email"
    }
    return email
  }

  println( getMailById("bob", buddies) )
  println( getMailById("john", buddies) )
  println( getMailById("jane", buddies) )


}