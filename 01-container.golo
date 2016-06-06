module containers

import stools

function main = |args| {
 
 let bob = Container("Bob Morane")
 println(bob: value()) 

 let john = Container(): of("John Doe")
 println(john: value())

}