#!/usr/bin/env bash
set -euo pipefail

LEAN_VERSION_TAG="stable"         # e.g. stable ⇒ 4.22.x  (or "nightly-2025-08-04")
MATHLIB_REV="v4.22.0"             # exact tag of mathlib4
AESOP_REV="main"                  # could be a SHA for reproducibility
BATTERIES_REV="main"              # idem
PROJECT="dissertation"            # Lake package name (folder will be created)

if ! command -v elan &>/dev/null; then
  echo "› Installing elan (Lean toolchain)…"
  curl https://elan.lean-lang.org/elan-init.sh -sSf | sh -s -- -y --default-toolchain "$LEAN_VERSION_TAG"  \
    && echo "export PATH=\"\$HOME/.elan/bin:\$PATH\"" >> "$HOME/.bashrc"
  # shellcheck source=/dev/null
  export PATH="$HOME/.elan/bin:$PATH"
fi

# python3 -m pip install --user --upgrade leanblueprint

export LEAN_PREFIX=$(lean --print-prefix)
export LD_LIBRARY_PATH="$LEAN_PREFIX/lib/lean:${LD_LIBRARY_PATH:-}"

