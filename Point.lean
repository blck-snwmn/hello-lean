inductive Color | red | green | blue

def toHex : Color → String
  | .red   => "#f00"
  | .green => "#0f0"
  | .blue  => "#00f"

instance : ToString Color where
  toString c := toHex c

structure Point where
  x : Int
  y : Int
  color : Color

def changeColor (p : Point) (c : Color) : Point := { p with color := c }

def main : IO Unit := do
  let p : Point := { x := 0, y := 2, color := Color.red }
  IO.println s!"Point at ({p.x}, {p.y}) with color {toHex p.color}"
  let p := changeColor p Color.green
  IO.println s!"Point at ({p.x}, {p.y}) with color {toHex p.color}"
  let p := {p with x := p.x + 10}
  IO.println s!"Point at ({p.x}, {p.y}) with color {toHex p.color}"

  IO.println s!"Point at ({p.x}, {p.y}) with color {p.color}"
