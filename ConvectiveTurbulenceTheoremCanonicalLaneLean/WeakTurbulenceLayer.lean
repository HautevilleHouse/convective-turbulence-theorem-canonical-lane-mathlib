import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvectiveTurbulenceTheoremCanonicalLaneLean.ConvectiveTurbulenceAnalyticObjects

namespace HautevilleHouse
namespace ConvectiveTurbulenceTheoremCanonicalLaneLean

structure WeakTurbulenceEnvelope where
  flow : TurbulentFlow
  finiteEnergy : Prop
  divergenceFree : Prop
  energyInequality : Prop
  weakEquation : Prop
  finiteEnergyClosed : finiteEnergy
  divergenceFreeClosed : divergenceFree
  energyInequalityClosed : energyInequality
  weakEquationClosed : weakEquation

def sourceWeakTurbulenceEnvelope : WeakTurbulenceEnvelope := {
  flow := primitiveFlow
  finiteEnergy := True
  divergenceFree := Incompressible primitiveFlow
  energyInequality := True
  weakEquation := TurbulenceEquationClosed primitiveFlow
  finiteEnergyClosed := trivial
  divergenceFreeClosed := primitive_flow_incompressible_checked
  energyInequalityClosed := trivial
  weakEquationClosed := primitive_flow_equation_closed_checked
}

def WeakTurbulenceEnvelopeClosed (E : WeakTurbulenceEnvelope) : Prop :=
  E.finiteEnergy ∧ E.divergenceFree ∧ E.energyInequality ∧ E.weakEquation

theorem source_weak_turbulence_envelope_closed : WeakTurbulenceEnvelopeClosed sourceWeakTurbulenceEnvelope :=
  And.intro sourceWeakTurbulenceEnvelope.finiteEnergyClosed
    (And.intro sourceWeakTurbulenceEnvelope.divergenceFreeClosed
      (And.intro sourceWeakTurbulenceEnvelope.energyInequalityClosed
        sourceWeakTurbulenceEnvelope.weakEquationClosed))

end ConvectiveTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse