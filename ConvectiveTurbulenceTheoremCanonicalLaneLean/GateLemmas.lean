import ConvectiveTurbulenceTheoremCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ConvectiveTurbulenceTheoremCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ConvectiveTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse