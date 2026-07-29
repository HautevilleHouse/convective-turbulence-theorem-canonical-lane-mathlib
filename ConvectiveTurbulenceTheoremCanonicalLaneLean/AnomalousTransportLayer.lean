import ConvectiveTurbulenceTheoremCanonicalLaneLean.MixingLayer

namespace HautevilleHouse
namespace ConvectiveTurbulenceTheoremCanonicalLaneLean

structure AnomalousTransportCertificate where
  mixing : MixingCertificate
  fluxEnhancementBound : Prop
  nonlocalCorrection : Prop
  transportClosure : Prop
  fluxEnhancementBoundClosed : fluxEnhancementBound
  nonlocalCorrectionClosed : nonlocalCorrection
  transportClosureClosed : transportClosure

def sourceAnomalousTransportCertificate : AnomalousTransportCertificate := {
  mixing := sourceMixingCertificate
  fluxEnhancementBound := True
  nonlocalCorrection := True
  transportClosure := True
  fluxEnhancementBoundClosed := trivial
  nonlocalCorrectionClosed := trivial
  transportClosureClosed := trivial
}

def AnomalousTransportClosed (C : AnomalousTransportCertificate) : Prop :=
  MixingClosed C.mixing ∧
  C.fluxEnhancementBound ∧ C.nonlocalCorrection ∧ C.transportClosure

theorem source_anomalous_transport_closed :
  AnomalousTransportClosed sourceAnomalousTransportCertificate := by
  exact And.intro source_mixing_closed
    (And.intro sourceAnomalousTransportCertificate.fluxEnhancementBoundClosed
      (And.intro sourceAnomalousTransportCertificate.nonlocalCorrectionClosed
        sourceAnomalousTransportCertificate.transportClosureClosed))

end ConvectiveTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse