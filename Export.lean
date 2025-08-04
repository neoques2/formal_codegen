import Lean
open Lean

@[extern "lean_add"]
def add (x y : UInt32) : UInt32 :=
  x + y
