import HelloLean

def main : IO Unit :=do
  IO.println s!"Hello, {hello}!"
  IO.println s!"My name is {sample.name}."
  IO.println s!"My name is {open sample in name}."
