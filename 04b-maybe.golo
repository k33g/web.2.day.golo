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


  let getMailById = |id, buddies| -> 
    Maybe()
      : fromNullable(
          buddies: find(|buddy| -> buddy: id(): equals(id))
        )
      : map(|buddy| -> buddy: address()) # return address of buddy
      : map(|address| -> address: email()) # return email of address
      : getOrElse("no email!")

  println( getMailById("bob", buddies) )

  println( getMailById("john", buddies) )

  println( getMailById("jane", buddies) )


}