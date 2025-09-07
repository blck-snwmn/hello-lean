# Repository Guidelines

## Project Structure & Module Organization
- Lean 4 project managed by Lake.
- Source: root example files (`Main.lean`, etc.) and library under `HelloLean/` (e.g., `HelloLean/Basic.lean`).
- Build config: `lakefile.lean` (package `hello-lean`), toolchain pinned in `lean-toolchain` (`leanprover/lean4:v4.22.0`).
- Build artifacts live in `.lake/` (untracked). Add new modules as `HelloLean/Foo/Bar.lean` and export via `HelloLean.lean`.

## Build, Test, and Development Commands
- `lake update` — fetch Lake dependencies.
- `lake build` — compile library and default executable.
- `lake exe hello-lean` — run the executable target (root `Main`).
- `lake env lean --run Main.lean` — run a single file for quick experiments.
- `lake clean` — remove build artifacts.
- `lake env lean --make HelloLean` — typecheck the library without running.

## Coding Style & Naming Conventions
- Indentation: 2 spaces; keep lines ≲100 columns.
- Modules/namespaces: UpperCamelCase (`HelloLean.Submodule`).
- Types/structures/classes: UpperCamelCase (`Point`, `Color`).
- Theorems/lemmas (terms of `Prop`): snake_case (e.g., `fib_add_fib_succ`).
- Functions/constants returning data: lowerCamelCase (`addOpt`, `printLoop`).
- When mixing, reference `UpperCamelCase` items in snake_case using lowerCamelCase segments.
- Add brief docstrings explaining intent.

## Testing Guidelines
- Prefer proof-backed checks: `theorem`/`example` blocks that compile under `lake build`.
- Place larger examples under `HelloLean/Tests` (or near the code) and keep `#eval` noise minimal.
- IO demos may live in small executables; ensure they run via `lake exe ...` in PRs.

## Commit & Pull Request Guidelines
- Commits: one line, ≤50 chars, explain WHY (value/outcome), not WHAT. Avoid filenames/line details.
  - Examples: “Improve database query speed”, “Prevent double mount on page init”, “Fix CI failure due to case‑sensitive path”.
- Staging policy: stage only intended files. Never use `git add -A` or `git add .`.
  - Examples: `git add AGENTS.md Main.lean Fib.lean` or `git add -p` to review hunks.
- PRs: clear motivation, linked issues, what/why summary, build/run steps, and relevant output/screenshot (if user-facing).
- All PRs must pass `lake build` and CI.

## CI & Security Notes
- GitHub Actions: `leanprover/lean-action` builds on push/PR.
- Do not commit secrets or large binaries; keep `.lake/` untracked.
- Pin new deps in `lakefile.lean` and run `lake update`.

## Agent-Specific Notes
- This AGENTS.md applies repo-wide. Tools and bots should respect style, naming, and commit rules above to reduce review friction.
