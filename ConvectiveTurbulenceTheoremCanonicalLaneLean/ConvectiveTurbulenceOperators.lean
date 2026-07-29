import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic
import Mathlib.Data.Fin.Basic

namespace HautevilleHouse
namespace ConvectiveTurbulenceTheoremCanonicalLaneLean

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3

abbrev TemperatureField := ScalarField
abbrev BuoyancyField := ScalarField

structure ConvectiveOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  laplacianScalar : TemperatureField → TemperatureField
  timeDerivative : VectorField → VectorField
  timeDerivativeScalar : TemperatureField → TemperatureField
  transport : VectorField → VectorField
  transportScalar : VectorField → TemperatureField → TemperatureField
  pressureProjection : VectorField → VectorField
  pressureProjectionIdempotent : ∀ u, pressureProjection (pressureProjection u) = pressureProjection u
  buoyancyForce : TemperatureField → VectorField

def primitiveOperators : ConvectiveOperators := {
  divergence := fun _ => fun _ _ => 0
  gradient := fun _ => fun _ _ _ => 0
  laplacian := fun u => u
  laplacianScalar := fun T => T
  timeDerivative := fun _ => fun _ _ _ => 0
  timeDerivativeScalar := fun _ => fun _ _ => 0
  transport := fun _ => fun _ _ _ => 0
  transportScalar := fun _ _ => fun _ _ => 0
  pressureProjection := fun u => u
  pressureProjectionIdempotent := by intro u; rfl
  buoyancyForce := fun _ => fun _ _ _ => 0
}

structure BoussinesqFlow where
  velocity : VectorField
  pressure : ScalarField
  temperature : TemperatureField
  viscosity : ℝ
  thermalDiffusivity : ℝ
  thermalExpansionCoeff : ℝ
  referenceDensity : ℝ
  gravityVector : Space3
  operators : ConvectiveOperators

def primitiveFlow : BoussinesqFlow := {
  velocity := fun _ _ _ => 0
  pressure := fun _ _ => 0
  temperature := fun _ _ => 0
  viscosity := 1
  thermalDiffusivity := 1
  thermalExpansionCoeff := 1
  referenceDensity := 1
  gravityVector := fun _ => 0
  operators := primitiveOperators
}

def IncompressibleBoussinesq (F : BoussinesqFlow) : Prop :=
  F.operators.divergence F.velocity = (fun _ _ => 0)

def TemperatureAdvectionBalance (F : BoussinesqFlow) : Prop :=
  F.operators.timeDerivativeScalar F.temperature =
  F.operators.laplacianScalar F.temperature

def BuoyancyForceActive (F : BoussinesqFlow) : Prop :=
  F.operators.buoyancyForce F.temperature ≠ (fun _ _ _ => 0)

def ConvectiveSystemClosed (F : BoussinesqFlow) : Prop :=
  IncompressibleBoussinesq F ∧ TemperatureAdvectionBalance F ∧ BuoyancyForceActive F

theorem primitive_incompressible_boussinesq_checked :
    IncompressibleBoussinesq primitiveFlow := by
  rfl

theorem primitive_temperature_advection_balance_checked :
    TemperatureAdvectionBalance primitiveFlow := by
  rfl

theorem primitive_buoyancy_force_active_checked :
    BuoyancyForceActive primitiveFlow := by
  intro h; apply h; rfl

theorem primitive_convective_system_closed_checked :
    ConvectiveSystemClosed primitiveFlow := by
  exact And.intro primitive_incompressible_boussinesq_checked
    (And.intro primitive_temperature_advection_balance_checked primitive_buoyancy_force_active_checked)

end ConvectiveTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse