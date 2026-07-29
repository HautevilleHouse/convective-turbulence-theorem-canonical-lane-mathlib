import ConvectiveTurbulenceTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ConvectiveTurbulenceTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedTheoremObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ConvectiveTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse