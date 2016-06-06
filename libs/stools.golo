module stools

# -----------------------------------------------------------
#   Container
# -----------------------------------------------------------

struct Container = {
  _value # private variable
}

augment Container {
  # kind of constructor
  function of = |this, value| -> Container(value)
  function value = |this| -> this: _value()
}


# -----------------------------------------------------------
#   Functor
# -----------------------------------------------------------

struct Functor = {
  _value # private variable
}

augment Functor {
  # kind of constructor
  function of = |this, value| -> Functor(value)
  function value = |this| -> this: _value()
  function map = |this, fn| -> Functor(): of(fn(this: _value()))
}

# -----------------------------------------------------------
#   Monad
# -----------------------------------------------------------

struct Monad = {
  _value # private variable
}
augment Monad {
  # kind of constructor
  function of = |this, value| -> Monad(value)
  function value = |this| -> this: _value()
  function map = |this, fn| -> Monad(): of(fn(this: _value()))
  # Now, I'm a Monad!
  function fmap = |this, fn| -> fn(this: _value()) # // flatMap, bind
}

# -----------------------------------------------------------
#   Maybe
# -----------------------------------------------------------

struct None = {
  _value # private variable
}
augment None {
  function value = |this| -> null
  function map = |this, fn| -> this
  function map = |this| -> this
  function fmap = |this, fn| -> null
  function fmap = |this| -> null
  function getOrElse = |this, value| -> value
  function isNone = |this| -> true
  function isSome = |this| -> false
}

struct Some = {
  _value # private variable
}
augment Some {
  function of = |this, value| -> Some(value)
  function value = |this| -> this: _value()
  function map = |this, fn| {
    let res = fn(this: _value())
    if res is null {
      return None()
    }
    return Some(res)
  }
  function fmap = |this, fn| -> fn(this: _value())
  function getOrElse = |this, value| -> this: _value()
  function isNone = |this| -> false
  function isSome = |this| -> true
}

# factory
struct Maybe = {
  _err # private variable
}
augment Maybe {
  function some = |this, value| -> Some(value)
  function none = |this, err| -> None()
  function fromNullable = |this, value| {
    if value is null {
      return None()
    } else {
      return Some(value)
    }
  }
}

# -----------------------------------------------------------
#   Either
# -----------------------------------------------------------

struct Left = {
  _err # private variable
}
augment Left {
  function value = |this| -> this: _err()
  function map = |this, fn| -> this
  function map = |this| -> this
  function fmap = |this, fn| -> this
  function fmap = |this| -> this
  function getOrElse = |this, value| -> value
  function cata = |this, leftFn, rightFn| -> leftFn(this: _err())
}

struct Right = {
  _value # private variable
}
augment Right {
  function value = |this| -> this: _value()
  function map = |this, fn| {
    let res = fn(this: _value())
    if res is null {
      return Left(res)
    }
    return Right(res)
  }
  function getOrElse = |this, value| -> this: _value()

  function cata = |this, leftFn, rightFn| -> rightFn(this: _value())
}

struct Either = {
  _value # private variable
}
augment Either {
  function right = |this, value| -> Right(value) 
  function left = |this, err| -> Left(err)
}


# -----------------------------------------------------------
#   Validation
# -----------------------------------------------------------

struct Success = {
  _value # private variable
}
augment Success {
  function value = |this| -> this: _value()
  function map = |this, fn| -> Success(fn(this: _value()))
  function isSuccess = |this| -> true
  function isFail = |this| -> false

  function ap = |this, otherContainer| {
    if otherContainer: isFail() {
      return otherContainer
    } else {
      return otherContainer: map(this: _value())
    }
  }

  function cata = |this, failureFn, successFn| -> successFn(this: _value())
}

struct Fail = {
  _value # private variable
}
augment Fail {
  function value = |this| -> this: _value()
  function map = |this| -> this
  function map = |this, fn| -> this

  function isSuccess = |this| -> false
  function isFail = |this| -> true

  function ap = |this, otherContainer| {
    if otherContainer: isFail() {
      let clone = this: _value(): clone()
      clone: addAll(otherContainer: value(): clone())
      return Fail(clone)
    } else {
      return this
    }
  }

  function cata = |this, failureFn, successFn| -> failureFn(this: _value())
}

struct Validation = {
  _value # private variable
}
augment Validation {
  function success = |this, value| -> Success(value) 
  function fail = |this, err| -> Fail(err)
}












