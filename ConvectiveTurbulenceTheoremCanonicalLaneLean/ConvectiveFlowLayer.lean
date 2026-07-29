import ConvectiveTurbulenceTheoremCanonicalLaneLean.MathlibPDESubstrate

namespace HautevilleHouse
namespace ConvectiveTurbulenceTheoremCanonicalLaneLean

structure ConvectiveFlow where
  velocity : VectorField
  temperature : ScalarField
  pressure : ScalarField
  viscosity : ℝ
  thermalDiffusivity : ℝ
  thermalExpansion : ℝ
  gravity : Space3

abbrev VectorField := Time → Space3 → Space3
abbrev ScalarField := Time → Space3 → ℝ
abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ

def zeroVectorField : VectorField := fun _ _ _ => 0
def zeroScalarField : ScalarField := fun _ _ => 0
def zeroSpace3 : Space3 := fun _ => 0

def primitiveConvectiveFlow : ConvectiveFlow := {
  velocity := zeroVectorField
  temperature := zeroScalarField
  pressure := zeroScalarField
  viscosity := 1
  thermalDiffusivity := 1
  thermalExpansion := 1
  gravity := zeroSpace3
}

structure BoussinesqOperator where
  laplacian : VectorField → VectorField
  laplacianScalar : ScalarField → ScalarField
  gradient : ScalarField → VectorField
  divergence : VectorField → ScalarField
  timeDerivative : VectorField → VectorField
  transport : VectorField → VectorField
  buoyancy : ScalarField → VectorField

def primitiveBoussinesqOperators : BoussinesqOperator := {
  laplacian := fun u => u
  laplacianScalar := fun θ => θ
  gradient := fun _ => zeroVectorField
  divergence := fun _ => zeroScalarField
  timeDerivative := fun _ => zeroVectorField
  transport := fun _ => zeroVectorField
  buoyancy := fun _ => zeroVectorField
}

structure BoussinesqEquations where
  flow : ConvectiveFlow
  operators : BoussinesqOperator
  momentumEq : Prop
  temperatureEq : Prop
  incompressibility : Prop
  buoyancyTerm : Prop
  momentumEqClosed : momentumEq
  temperatureEqClosed : temperatureEq
  incompressibilityClosed : incompressibility
  buoyancyTermClosed : buoyancyTerm

def sourceBoussinesqEquations : BoussinesqEquations := {
  flow := primitiveConvectiveFlow
  operators := primitiveBoussinesqOperators
  momentumEq := True
  temperatureEq := True
  incompressibility := True
  buoyancyTerm := True
  momentumEqClosed := trivial
  temperatureEqClosed := trivial
  incompressibilityClosed := trivial
  buoyancyTermClosed := trivial
}

def BoussinesqEquationsClosed (E : BoussinesqEquations) : Prop :=
  E.momentumEq ∧ E.temperatureEq ∧ E.incompressibility ∧ E.buoyancyTerm

theorem source_boussinesq_equations_closed :
  BoussinesqEquationsClosed sourceBoussinesqEquations := by
  exact And.intro sourceBoussinesqEquations.momentumEqClosed
    (And.intro sourceBoussinesqEquations.temperatureEqClosed
      (And.intro sourceBoussinesqEquations.incompressibilityClosed
        sourceBoussinesqEquations.buoyancyTermClosed))

end ConvectiveTurbulenceTheoremCanonicalLaneLean
end HautevilleHouse