import Lake
import Lean.Elab.Facet
open Lake DSL

package exportExample

@[default_target]
lean_lib Export where
  precompileModules := true
  nativeFacets := fun _ => #[.sharedLib]

