import HelloLean

def add(x y : Nat) : Nat := x + y
def addOnce := add 1

def addOpt(x y : Option Nat) : Option Nat := do
  -- let x' ← x
  -- let y' ← y
  -- pure (x' + y')
  pure ((<- x)+ (<- y))

class ToStr (α : Type) where
  toStr : α → String

instance : ToStr Bool where
  toStr | true => "true" | false => "false"

def showIt {α} [ToStr α] (x : α) : String := ToStr.toStr x

#eval showIt true
#eval showIt false

def main : IO Unit :=do
  IO.println s!"Hello, {hello}!"
  IO.println s!"My name is {sample.name}."
  IO.println s!"My name is {open sample in name}."
  IO.println s!"My name is {open short in sig}: {open short in name}."
  IO.println s!"nest.sampleA.param = {nest.sampleA.param}"

  let x := 1 |> addOnce
  IO.println s!"add_once = {x}"

  let x := 1 |> add 2 |> add 5
  IO.println s!"add 1 2, 5 = {x}"

  let x := 1 |> (add . 3)
  IO.println s!"add 1 3 = {x}"

  let x := (some 5).map add <*> some 10
  IO.println s!"x = {x}"

  let x := (some 5 |> Option.map add) <*> some 10
  IO.println s!"x = {x}"

  let x := some 5 |> Option.map add |> (. <*> some 10)
  IO.println s!"x = {x}"

  let x := (some 5).map addOnce
  IO.println s!"x = {x}"

  let x := some 5 |> Option.map addOnce
  IO.println s!"x = {x}"

  let x := pure add <*> some 6 <*> some 11
  IO.println s!"x = {x}"

  let x :=  addOpt (some 5) (some 19)
  IO.println s!"x = {x}"
