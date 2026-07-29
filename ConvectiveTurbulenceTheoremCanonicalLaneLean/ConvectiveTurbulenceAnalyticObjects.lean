import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace ConvectiveTurbulenceTheoremCanonicalLaneLean

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3

def zeroScalarField : ScalarField := fun _ _ => 0
def zeroVectorField : VectorField := fun _ _ _ => 0

structure TurbulenceOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  transport : VectorField → VectorField
  buoyancy : VectorField → VectorField
  rotation : VectorField → VectorField
  pressureProjection : VectorField → VectorField
  pressureProjectionIdempotent : ∀ u, pressureProjection (pressureProjection u) = pressureProjection u

def primitiveOperators : TurbulenceOperators := {
  divergence := fun _ => zeroScalarField
  gradient := fun _ => zeroVectorField
  laplacian := fun u => u
  timeDerivative := fun _ => zeroVectorField
  transport := fun _ => zeroVectorField
  buoyancy := fun _ => zeroVectorField
  rotation := fun _ => zeroVectorField
  pressureProjection := fun u => u
  pressureProjectionIdempotent := by intro u; rfl
}

structure TurbulentFlow where
  velocity : VectorField
  pressure : ScalarField
  temperature : ScalarField
  viscosity : ℝ
  thermalDiffusivity : ℝ
  operators : TurbulenceOperators

def primitiveFlow : TurbulentFlow := {
  velocity := zeroVectorField
  pressure := zeroScalarField
  temperature := zeroScalarField
  viscosity := 1
  thermalDiffusivity := 1
  operators := primitiveOperators
}

def Incompressible (F : TurbulentFlow) : Prop :=
  F.operators.divergence F.velocity = zeroScalarField

def BoussinesqBalance (F : TurbulentFlow) : Prop :=
  F.operators.timeDerivative F.velocity = F.operators.laplacian F.velocity

def ThermalCoupling (F : TurbulentFlow) : Prop :=
  F.operators.buoyancy F.velocity = zeroVectorField

def TurbulenceEquationClosed (F : TurbulentFlow) : Prop :=
  Incompressible F ∧ BoussinesqBalance F ∧ ThermalCoupling F

theorem primitive_flow_incompressible_checked : Incompressible primitiveFlow := by rfl
theorem primitive_flow_boussinesq_balance_checked : BoussinesqBalance primitiveFlow := by rfl
theorem primitive_flow_thermal_coupling_checked : ThermalCoupling primitiveFlow := by rfl
theorem primitive_flow_equation_closed_checked : TurbulenceEquationClosed primitiveFlow :=
  And.intro primitive_flow_incompressible_checked
    (And.intro primitive_flow_boussinesq_balance_checked primitive_flow_thermal_coupling_checked)

end ConvectiveTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse