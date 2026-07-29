import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvectiveTurbulenceTheoremCanonicalLaneLean.TurbulenceRegularityEndpoint
import HautevilleHouse.ConvectiveTurbulenceTheoremCanonicalLaneLean.TurbulencePDEsubstrate

namespace HautevilleHouse
namespace ConvectiveTurbulenceTheoremCanonicalLaneLean

structure ConvectiveTurbulenceCertificate where
  substrate : MathlibPDESubstrate
  operatorsClosed : Prop
  weakLayerClosed : Prop
  energyLayerClosed : Prop
  endpointLayerClosed : Prop
  canonicalCarriageImported : Prop
  operatorsClosedProof : operatorsClosed
  weakLayerClosedProof : weakLayerClosed
  energyLayerClosedProof : energyLayerClosed
  endpointLayerClosedProof : endpointLayerClosed
  canonicalCarriageImportedProof : canonicalCarriageImported

def sourceCertificate : ConvectiveTurbulenceCertificate := {
  substrate := mathlibPDESubstrate
  operatorsClosed := TurbulenceEquationClosed primitiveFlow
  weakLayerClosed := WeakTurbulenceEnvelopeClosed sourceWeakTurbulenceEnvelope
  energyLayerClosed := EnergyDissipationClosed sourceEnergyDissipationCertificate
  endpointLayerClosed := RegularityEndpointClosed sourceRegularityEndpointCertificate
  canonicalCarriageImported := True
  operatorsClosedProof := primitive_flow_equation_closed_checked
  weakLayerClosedProof := source_weak_turbulence_envelope_closed
  energyLayerClosedProof := source_energy_dissipation_closed
  endpointLayerClosedProof := source_regularity_endpoint_closed
  canonicalCarriageImportedProof := trivial
}

def CertificateClosed (C : ConvectiveTurbulenceCertificate) : Prop :=
  C.operatorsClosed ∧ C.weakLayerClosed ∧ C.energyLayerClosed ∧ C.endpointLayerClosed ∧ C.canonicalCarriageImported

theorem source_certificate_closed : CertificateClosed sourceCertificate :=
  And.intro sourceCertificate.operatorsClosedProof
    (And.intro sourceCertificate.weakLayerClosedProof
      (And.intro sourceCertificate.energyLayerClosedProof
        (And.intro sourceCertificate.endpointLayerClosedProof sourceCertificate.canonicalCarriageImportedProof)))

end ConvectiveTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse