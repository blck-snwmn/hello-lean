import HelloLean

def add(x y : Nat) : Nat := x + y
def add_once := add 1

def main : IO Unit :=do
  IO.println s!"Hello, {hello}!"
  IO.println s!"My name is {sample.name}."
  IO.println s!"My name is {open sample in name}."
  IO.println s!"My name is {open short in sig}: {open short in name}."
  IO.println s!"nest.sampleA.param = {nest.sampleA.param}"

  let x := 1 |> add_once
  IO.println s!"add_once = {x}"

  let x := 1 |> add 2
  IO.println s!"add 2 = {x}"

  let x := 1 |> (add . 3)
  IO.println s!"add 3 = {x}"

  let x := (some 5).map add <*> some 10
  IO.println s!"x = {x}"

  let x := (some 5 |> Option.map add) <*> some 10
  IO.println s!"x = {x}"

  let x := some 5 |> Option.map add |> (. <*> some 10)
  IO.println s!"x = {x}"

  let x := (some 5).map add_once
  IO.println s!"x = {x}"

  let x := some 5 |> Option.map add_once
  IO.println s!"x = {x}"

  let x := pure add <*> some 6 <*> some 11
  IO.println s!"x = {x}"
