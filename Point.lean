

structure Pos where
  x : Int
  y : Int

instance : Add Pos where
  add l r := { x := l.x + r.x, y := l.y + r.y }

instance: HAdd Nat Pos Pos where
  hAdd n p := { x := n + p.x, y := n + p.y }

instance: HAdd Pos Nat Pos where
  hAdd p n := { x := p.x + n, y := p.y + n }

instance: HMul Nat Pos Pos where
  hMul n p := { x := n * p.x, y := n * p.y }

instance: HMul Pos Nat Pos where
  hMul p n := { x := n * p.x, y := n * p.y }

instance: ToString Pos where
  toString p := s!"({p.x}, {p.y})"

inductive Color | red | green | blue

def toHex : Color → String
  | .red   => "#f00"
  | .green => "#0f0"
  | .blue  => "#00f"

instance : ToString Color where
  toString c := toHex c
structure Point where
  pos : Pos
  color : Color

def changeColor (p : Point) (c : Color) : Point := { p with color := c }

def main : IO Unit := do
  let p : Point := { pos :=  {x := 0, y := 2 }, color := Color.red }
  IO.println s!"Point at {p.pos} with color {toHex p.color}"
  let p := changeColor p Color.green
  IO.println s!"Point at {p.pos} with color {toHex p.color}"
  let p := {p with pos := {p.pos with x := 5}}
  IO.println s!"Point at {p.pos} with color {toHex p.color}"

  let lp: Pos := { x := 3, y := 5 }
  IO.println s!"Pos at {lp} for `lp`"
  let rp: Pos := { x := 1, y := 2 }
  IO.println s!"Pos at {rp} for `rp`"

  let p := lp + rp
  IO.println s!"Pos at {p} for `p=lp + rp`"

  let p := (3 : Nat) + p
  IO.println s!"Pos at {p} for `p=(3 : Nat) + p`"

  let p := p + (7 : Nat)
  IO.println s!"Pos at {p} for `p=p + (7 : Nat)`"

  let p := p * 3
  IO.println s!"Pos at {p} for `p=p * 3`"

  let p := 5 * p
  IO.println s!"Pos at {p} for `p=5 * p`"
