def fib(n : Nat) : Nat :=
  match n with
  | 0 => 0
  | 1 => 1
  | n+2 => fib (n+1) + fib n

#eval fib 10

def fibTR (n : Nat) : Nat :=
  let rec loop (n a b : Nat) : Nat :=
    match n with
    | 0     => a
    | n+1   => loop n b (a+b)
  loop n 0 1

#eval fibTR 10

def print_loop(n: Nat) : IO Unit :=
  for i in [0:n] do
    IO.println s!"{i}: {fib i} {fibTR i}"

def main : IO Unit :=do
  print_loop 20
