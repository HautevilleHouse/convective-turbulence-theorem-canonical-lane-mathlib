import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvectiveTurbulenceTheoremCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.ConvectiveTurbulenceTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ConvectiveTurbulenceTheoremCanonicalLaneLean

def ConstrainedTurbulenceClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_turbulence_endgame (A : AdmissibleClass) : ConstrainedTurbulenceClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ConvectiveTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse