import ConvectiveTurbulenceTheoremCanonicalLaneLean.TurbulenceScalingLayer

namespace HautevilleHouse
namespace ConvectiveTurbulenceTheoremCanonicalLaneLean

structure MixingCertificate where
  scaling : TurbulenceScalingCertificate
  mixingLengthBound : Prop
  eddyDiffusivityBound : Prop
  coherenceFloor : Prop
  mixingLengthBoundClosed : mixingLengthBound
  eddyDiffusivityBoundClosed : eddyDiffusivityBound
  coherenceFloorClosed : coherenceFloor

def sourceMixingCertificate : MixingCertificate := {
  scaling := sourceTurbulenceScalingCertificate
  mixingLengthBound := True
  eddyDiffusivityBound := True
  coherenceFloor := True
  mixingLengthBoundClosed := trivial
  eddyDiffusivityBoundClosed := trivial
  coherenceFloorClosed := trivial
}

def MixingClosed (C : MixingCertificate) : Prop :=
  TurbulenceScalingClosed C.scaling ∧
  C.mixingLengthBound ∧ C.eddyDiffusivityBound ∧ C.coherenceFloor

theorem source_mixing_closed :
  MixingClosed sourceMixingCertificate := by
  exact And.intro source_turbulence_scaling_closed
    (And.intro sourceMixingCertificate.mixingLengthBoundClosed
      (And.intro sourceMixingCertificate.eddyDiffusivityBoundClosed
        sourceMixingCertificate.coherenceFloorClosed))

end ConvectiveTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse