import ConvectiveTurbulenceTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ConvectiveTurbulenceTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact And.intro A.object.sourceKeyChecked A.object.theoremObjectChecked

end ConvectiveTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse