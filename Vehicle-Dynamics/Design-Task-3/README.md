# Design Task 3 – Vertical Dynamics: Ride Comfort, Road Grip & ISO 2631

**Course:** MMF062 Vehicle Motion Engineering
**Authors:** George Vasanth Fransua S, Ramkumar Huleppa Munavalli (Group 5)
**Date:** January 2025
**Tools:** MATLAB

📄 [Full report (PDF)](MMF062_VME_DesignTask3_Group5.pdf)

---

## Overview
This project analyses the vertical dynamics of a passenger car with a **two-degree-of-freedom quarter-car model** (sprung and unsprung mass). It derives the state-space model and the frequency-domain transfer functions for **ride comfort, suspension travel and road grip**, and finds the bounce and wheel-hop natural frequencies. It then studies how spring stiffness and damping trade ride comfort against tyre-force variation on a random road. Finally, it evaluates whole-body vibration exposure over a working day according to **ISO 2631-1** and the **EU Directive 2002/44/EC**.

### Vehicle data
| Parameter | Value |
|-----------|-------|
| Sprung / unsprung mass (total) | 1675 kg / 185 kg |
| Weight distribution (front/rear) | 60 / 40 |
| Suspension stiffness, front / rear | 30.8 / 29.9 kN/m (per wheel) |
| Suspension damping, front / rear | 4500 / 3500 Ns/m (per wheel) |
| Tyre stiffness | 230 kN/m |

## Task 1 – Quarter-Car Transfer Functions
- Derived the equations of motion and wrote them in state-space form, ẋ = Ax + Bu, with the state vector x = [zs, zu, żs, żu] and the road displacement zr as input.
- Computed the transfer functions H(ω) = C(jωI − A)⁻¹B + D from road input to:
  - **sprung mass acceleration** (ride comfort)
  - **suspension travel** (zu − zs)
  - **dynamic tyre force** (road grip)
- Plotted all three from 0.1 to 50 Hz for the front and rear wheels.
- **Natural frequencies:**

| Wheel | Bounce | Wheel hop |
|-------|--------|-----------|
| Front | 1.17 Hz | 11.95 Hz |
| Rear | 1.41 Hz | 11.93 Hz |

The front has the lower bounce frequency because it carries more sprung mass, which gives a softer, more comfortable ride at the front.

## Task 2 – Suspension Stiffness and Damping Study
- Modelled the road as a random profile with a power spectral density (PSD) at 80 km/h. Calculated the response PSDs and rms values: sprung mass acceleration ≈ **1.19 m/s² rms** and dynamic tyre force ≈ **676 N rms**.
- Swept front spring stiffness (0.5–2× nominal) and damping (1000–9000 Ns/m) and found the optimal damping for each stiffness:
  - **Ride comfort** is best with a softer spring and lower damping.
  - **Road grip** (low tyre-force variation) needs higher damping, which controls wheel-hop oscillations and keeps the tyre in contact with the road.
  - The optimal damping for both rises with spring stiffness, and the two optima converge at the stiffest spring.

## Task 3 – Ride Comfort and ISO 2631
- Defined a daily driving scenario: 8 hours on a 160 km route, made up of 70 % smooth, 17.5 % rough and 12.5 % very rough road.
- Calculated ISO 2631-weighted rms acceleration for each road type, then the time-averaged daily exposure, and compared it with the EU daily action value of **1.15 m/s²**.

| Road | Speed (110 km/h everywhere) | Weighted rms | Adjusted speed | Weighted rms |
|------|------------------------------|--------------|----------------|--------------|
| Smooth | 110 km/h | 0.39 m/s² | 110 km/h | 0.39 m/s² |
| Rough | 110 km/h | 1.22 m/s² | 101 km/h | 1.15 m/s² |
| Very rough | 110 km/h | 4.03 m/s² | 8.5 km/h | 1.12 m/s² |
| **Daily exposure** | | **1.55 m/s²** ❌ | | **0.98 m/s²** ✅ |

At 110 km/h on every road, the daily exposure exceeds the limit. Limiting the speed to 101 km/h on rough roads and 8.5 km/h on very rough roads brings every road type, and the daily exposure, below 1.15 m/s².

> **Correction:** the submitted report gives daily exposures of 36.6 and 51.7 m/s². These came from a misplaced bracket in the time-averaging formula in `VerticalDynamicsTask3Skeleton.m`. The formula is fixed in this repository, and the table above shows the corrected values. The per-road rms values in the report were not affected.

## Files
| File | Description |
|------|-------------|
| [`InitParametersSkeleton.m`](InitParametersSkeleton.m) | Vehicle, road and driving-scenario parameters for all tasks |
| [`VerticalDynamicsTask1Skeleton.m`](VerticalDynamicsTask1Skeleton.m) | Task 1: state-space model, transfer functions (ride, travel, tyre force) and natural frequencies |
| [`VerticalDynamicsTask2Skeleton.m`](VerticalDynamicsTask2Skeleton.m) | Task 2: road PSD, response spectra, rms values and the stiffness/damping sweep |
| [`VerticalDynamicsTask3Skeleton.m`](VerticalDynamicsTask3Skeleton.m) | Task 3: ISO 2631-weighted rms per road type and daily vibration exposure |
| [`CalculateIsoWeightedRms.m`](CalculateIsoWeightedRms.m) | ISO 2631-1 frequency weighting (Wk) and weighted rms calculation |

The script skeletons, `InitParametersSkeleton.m` and `CalculateIsoWeightedRms.m` were provided by the course. Our group's work is the model derivation, the state-space matrices and transfer functions, the PSD and rms calculations, the parameter studies and the analysis.

## How to run
1. Open this folder in MATLAB. All files must be in the same folder.
2. Run `VerticalDynamicsTask1Skeleton.m`, `VerticalDynamicsTask2Skeleton.m` or `VerticalDynamicsTask3Skeleton.m`. Each script loads `InitParametersSkeleton.m` itself.
3. **Task 3 adjusted speeds:** in `InitParametersSkeleton.m`, swap the active speed lines for the commented-out ones (110 / 101 / 8.5 km/h), then run Task 3 again.

## Key Skills
`Vertical vehicle dynamics` · `Quarter-car model` · `State-space modelling` · `Frequency response / transfer functions` · `Random road PSD` · `Suspension tuning` · `ISO 2631 ride comfort` · `MATLAB`
