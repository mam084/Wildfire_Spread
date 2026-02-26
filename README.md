
# Modeling How Moisture Affects Wildfire Spread

This project implements a cellular automaton model in MATLAB to simulate wildfire propagation across a grid, with a focus on how environmental moisture and fire-induced drying affect spread dynamics.

The full mathematical background and analysis are documented in the accompanying paper:
Modeling How Moisture Affects Wildfire Spread (March 2024)

---

## Project Overview

Wildfire behavior depends on many environmental factors. This model isolates one critical variable — moisture content — to better understand its role in fire propagation.

The simulation models fire spread on a 2D grid where:

- Each cell represents a patch of vegetation.
- Fire begins at a single ignition point (center of the grid).
- Fire spreads probabilistically to adjacent cells.
- Moisture reduces ignition probability.
- Cells that do not ignite experience drying due to nearby heat exposure.

The goal of this project is to explore:

- How ignition probability affects fire growth
- How varying moisture levels slow propagation
- How drying alters long-term fire behavior

---

## Mathematical Model

### Base Ignition Rule

Fire spreads according to a probabilistic rule:

R <= p

Where:
- R is a random number in [0,1]
- p is the ignition probability

If the condition holds, the adjacent cell ignites.

---

### Moisture Adjustment

Moisture is modeled as a scalar m in [0,1]:

- m = 0 → completely dry
- m = 1 → fully saturated

Ignition probability becomes:

p_effective = p(1 - m)

Higher moisture reduces ignition likelihood.

---

### Drying Effect

Cells adjacent to fire that do not ignite experience moisture reduction:

m_(t+1) = m_t / d

Where:
- d is the drying factor
- Larger d means faster drying

---

## Simulation Details

- 2D grid-based cellular automaton
- Fire spreads only to directly adjacent cells
- 10 time iterations per simulation
- Each experiment averaged over 1000 trials
- Fire area measured as number of burning cells per timestep

---

## Experiments Conducted

### 1. No Moisture, No Drying
Explores propagation for ignition probabilities:
- 25%
- 50%
- 75%

Result: Higher ignition probability leads to significantly faster and larger spread.

### 2. Moisture Without Drying
Fixed ignition probability p = 0.5  
Moisture levels tested:
- 0
- 0.25
- 0.5
- 0.75

Result: Increasing moisture substantially slows fire growth.

### 3. Moisture With Drying
Fixed:
- p = 0.5
- Moisture = 0.75

Drying factors tested:
- 1 (no drying)
- 2
- 4
- 8

Result:
- Drying accelerates fire growth over time.
- Even strong drying does not fully match the speed of a completely dry grid due to delayed moisture reduction.

---

## How to Run

1. Open MATLAB.
2. Navigate to the project directory.
3. Run the main simulation script:

   main

4. Plots will generate automatically showing fire area vs. time.

Parameters such as ignition probability, moisture level, drying factor, number of iterations, and number of trials can be adjusted directly in the script.

---

## Key Findings

- Moisture significantly inhibits wildfire spread.
- Drying reduces the dampening effect over time.
- Moisture introduces delayed propagation behavior.
- Even aggressive drying does not replicate a completely dry environment immediately.

---

## Limitations

This model makes several simplifying assumptions:

- Uniform moisture across the grid
- Fire spreads only to directly adjacent cells
- Drying occurs only for immediate neighbors
- No wind or ember-based long-distance spread
- No spatial heterogeneity

These simplifications allow isolation of moisture effects but limit real-world fidelity.

---

## Future Improvements

Potential extensions include:

- Spatially varying moisture
- Wind-driven propagation
- Stochastic embers
- Non-local drying effects
- Larger simulation horizons
- Continuous-time modeling

---

## Author

Matthew Mitchell  
March 2024
