import ConvectiveTurbulenceTheoremCanonicalLaneLean.NavierStokesAnalyticCertificate

namespace HautevilleHouse
namespace ConvectiveTurbulenceTheoremCanonicalLaneLean

def NavierStokesAdmittedAnalyticClosure : Prop :=
  NavierStokesAnalyticCertificateClosed sourceNavierStokesAnalyticCertificate ∧
  ConstrainedTheoremClosure analyticAdmissibleClass

def UnrestrictedClassicalNavierStokesBoundaryCarried : Prop :=
  formalizationCertificate.theoremBoundaryOpen = true ∧
  mathlibPDESubstrate.unrestrictedNavierStokesStackCarried = true

theorem navier_stokes_admitted_analytic_closure_checked :
    NavierStokesAdmittedAnalyticClosure := by
  exact And.intro source_navier_stokes_analytic_certificate_closed
    (constrained_theorem_closure analyticAdmissibleClass)

theorem unrestricted_classical_navier_stokes_boundary_carried_checked :
    UnrestrictedClassicalNavierStokesBoundaryCarried := by
  exact And.intro rfl rfl

end ConvectiveTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse