def fib(n : Nat) : Nat :=
  match n with
  | 0 => 0
  | 1 => 1
  | n+2 => fib (n+1) + fib n

#eval fib 10

-- 末尾再帰ループをトップレベルに分離
private def fibLoop (n a b : Nat) : Nat :=
  match n with
  | 0     => a
  | n+1   => fibLoop n b (a + b)

def fibTR (n : Nat) : Nat :=
  fibLoop n 0 1

#eval fibTR 10

def print_loop(n: Nat) : IO Unit :=
  for i in [0:n] do
    IO.println s!"{i}: {fib i} {fibTR i}"

def main : IO Unit :=do
  print_loop 20

/-!
`fib` と末尾再帰版 `fibTR` が点ごとに一致することを示す。

鍵となる不変量は、内部ループ `loop` に対して

  loop n (fib k) (fib (k+1)) = fib (n + k)

である。これを `n` に関する帰納法で証明し、`k = 0` を代入すれば
`loop n 0 1 = fib n`、すなわち `fibTR n = fib n` が従う。
-/

theorem fibTR_eq_fib : ∀ n, fibTR n = fib n := by
  -- 一般化した不変量を先に証明する
  have loop_eq_fib : ∀ n, ∀ k, fibLoop n (fib k) (fib (k+1)) = fib (n + k) := by
    intro n
    induction n with
    | zero =>
        intro k; simp [fibLoop, Nat.zero_add]
    | succ n ih =>
        intro k
        -- 1 ステップ簡約して帰納法を適用
        calc
          fibLoop (n+1) (fib k) (fib (k+1))
              = fibLoop n (fib (k+1)) (fib k + fib (k+1)) := by
                simp [fibLoop]
          _   = fibLoop n (fib (k+1)) (fib (k+2)) := by
                simp [fib, Nat.add_comm]
          _   = fib (n + (k+1)) := by
                simpa using ih (k+1)
          _   = fib ((n+1) + k) := by
                simp [Nat.add_comm, Nat.add_left_comm]
  -- 仕上げ：k = 0 を代入して `fibTR` の定義と整合させる
  intro n
  -- `fib 0 = 0`, `fib 1 = 1`, `n + 0 = n` を使って同値に書き換える
  -- `loop` の束縛と衝突しないように、ここで別名 `L` を導入して書き換える
  -- ただし `simp` では束縛の展開に `fibTR` と `fib` の定義しか使わない
  simpa [fibTR, fib, Nat.add_zero] using (loop_eq_fib n 0)
