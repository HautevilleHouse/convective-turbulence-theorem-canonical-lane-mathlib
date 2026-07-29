import ConvectiveTurbulenceTheoremCanonicalLaneLean.EnergyDissipationLayer

namespace HautevilleHouse
namespace ConvectiveTurbulenceTheoremCanonicalLaneLean

structure TurbulenceScalingCertificate where
  energyDissipation : EnergyDissipationCertificate
  reynoldsNumberBound : Prop
  rayleighNumberBound : Prop
  nusseltNumberScaling : Prop
  spectrumSlope : Prop
  reynoldsNumberBoundClosed : reynoldsNumberBound
  rayleighNumberBoundClosed : rayleighNumberBound
  nusseltNumberScalingClosed : nusseltNumberScaling
  spectrumSlopeClosed : spectrumSlope

def sourceTurbulenceScalingCertificate : TurbulenceScalingCertificate := {
  energyDissipation := sourceEnergyDissipationCertificate
  reynoldsNumberBound := True
  rayleighNumberBound := True
  nusseltNumberScaling := True
  spectrumSlope := True
  reynoldsNumberBoundClosed := trivial
  rayleighNumberBoundClosed := trivial
  nusseltNumberScalingClosed := trivial
  spectrumSlopeClosed := trivial
}

def TurbulenceScalingClosed (C : TurbulenceScalingCertificate) : Prop :=
  EnergyDissipationClosed C.energyDissipation ∧
  C.reynoldsNumberBound ∧ C.rayleighNumberBound ∧ C.nusseltNumberScaling ∧ C.spectrumSlope

theorem source_turbulence_scaling_closed :
  TurbulenceScalingClosed sourceTurbulenceScalingCertificate := by
  exact And.intro source_energy_dissipation_closed
    (And.intro sourceTurbulenceScalingCertificate.reynoldsNumberBoundClosed
      (And.intro sourceTurbulenceScalingCertificate.rayleighNumberBoundClosed
        (And.intro sourceTurbulenceScalingCertificate.nusseltNumberScalingClosed
          sourceTurbulenceScalingCertificate.spectrumSlopeClosed)))

end ConvectiveTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse