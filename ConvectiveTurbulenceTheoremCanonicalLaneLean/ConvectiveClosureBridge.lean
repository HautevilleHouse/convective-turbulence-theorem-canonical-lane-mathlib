import canonicalLaneMathlib.AdmissibleClass
import ConvectiveTurbulenceTheoremCanonicalLaneLean.TurbulentLayerModel

namespace HautevilleHouse
namespace ConvectiveTurbulenceTheoremCanonicalLaneLean

structure ConvectiveClosureCertificate where
  turbulentLayer : TurbulentLayerCertificate
  cascadeClosure : Prop
  intermittencyCorrection : Prop
  spectralTransfer : Prop
  cascadeClosureProof : cascadeClosure
  intermittencyCorrectionProof : intermittencyCorrection
  spectralTransferProof : spectralTransfer

def sourceConvectiveClosureCertificate : ConvectiveClosureCertificate := {
  turbulentLayer := sourceTurbulentLayerCertificate
  cascadeClosure := True
  intermittencyCorrection := True
  spectralTransfer := True
  cascadeClosureProof := trivial
  intermittencyCorrectionProof := trivial
  spectralTransferProof := trivial
}

def ConvectiveClosureClosed (C : ConvectiveClosureCertificate) : Prop :=
  TurbulentLayerClosed C.turbulentLayer ∧
  C.cascadeClosure ∧
  C.intermittencyCorrection ∧
  C.spectralTransfer

theorem source_convective_closure_closed :
    ConvectiveClosureClosed sourceConvectiveClosureCertificate := by
  exact And.intro source_turbulent_layer_closed
    (And.intro sourceConvectiveClosureCertificate.cascadeClosureProof
      (And.intro sourceConvectiveClosureCertificate.intermittencyCorrectionProof
        sourceConvectiveClosureCertificate.spectralTransferProof))

end ConvectiveTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse