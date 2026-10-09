# Design Task 2 – Lateral Vehicle Dynamics, Load Transfer & Driving Simulator Validation

**Course:** MMF062 Vehicle Motion Engineering
**Authors:** George Vasanth Fransua S, Ramkumar Huleppa Munavalli (Group 5)
**Date:** December 2024
**Tools:** MATLAB / Simulink, CASTER driving simulator

📄 [Full report (PDF)](MMF062_VME_DesignTask2_Group5.pdf)

---

## Overview
This project studies the lateral (handling) dynamics of a passenger car with a **single-track (bicycle) model**. It derives the steady-state cornering equations, finds the understeer gradient and critical/characteristic speeds, and simulates the transient steering response in Simulink. The model is then extended with **lateral load transfer**, **roll stiffness distribution** and **combined tyre slip** under braking, and the roll stiffness and brake force distributions are tuned for neutral steer. Finally, the model was validated and driven in the **CASTER driving simulator**, and the logged skid-pad and brake test data were analysed.

### Vehicle data (Saab 9-3)
| Parameter | Value |
|-----------|-------|
| Mass / yaw inertia | 1675 kg / 2617 kg·m² |
| Wheelbase / track width | 2.675 m / 1.51 m |
| CoG height | 0.543 m |
| Steering ratio | 15.9 |
| Tyre cornering stiffness | C = c₀·Fz + c₁·Fz² (c₀ = 30.7, c₁ = −0.00235) |
| Total roll stiffness | 70 kNm/rad |

## Task 1 – Steady-State Cornering
- Derived the steady-state cornering equations of the single-track model with a linear tyre model, then solved them symbolically for lateral velocity vy and yaw rate ω.
- Evaluated three load cases (CoG position lf/L) at 100 km/h and ay = 4 m/s²:

| Load case | lf/L | Understeer gradient Ku | Critical speed | Characteristic speed | Steering wheel angle | Behaviour |
|-----------|------|------------------------|----------------|----------------------|----------------------|-----------|
| 1 | 0.37 | +0.00117 | – | 47.8 m/s | 16.9° | Understeer |
| 2 | 0.63 | −0.00117 | 47.8 m/s | – | 8.4° | Oversteer |
| 3 | 0.47 | +0.00027 | – | 100.2 m/s | 13.6° | Close to neutral |

- Plotted steering wheel angle against speed on a 200 m radius curve. The required angle rises with speed for understeer, falls for oversteer, and stays almost flat near neutral steer.

## Task 2 – Single-Track Simulation
- Implemented the single-track model in Simulink and verified it with a step steer at 100 km/h. All load cases reach the target ay = 4 m/s².
- **Transient response:** the understeer setup (load case 1) responded fastest and reached 4 m/s² in 3.72 s.
- **Over-critical speed:** at 200 km/h (above the 47.8 m/s critical speed) the oversteer car becomes unstable. Yaw rate grows strongly even with a 3° steering input.

## Task 3 – Lateral Load Transfer & Roll Stiffness Distribution
- Added lateral load transfer, using roll-centre heights and the front/rear roll stiffness distribution. Load transfer lowers the reached lateral acceleration by 3–7 % compared with the model without it.
- Lowering the front roll stiffness share from 0.65 to 0.45 moves the car towards oversteer.
- **Proposed setup:** a front/total roll stiffness distribution of **0.24** gives neutral steer for load case 3. However, a real car must work across many load cases, so this value is not recommended for a production car.

## Task 4 – Combined Tyre Slip & Brake Force Distribution
- Added a combined-slip tyre model. During braking in a turn, longitudinal force reduces the available lateral force, so the car no longer steers neutrally.
- With only **20 % of the brake force on the front axle**, the rear axle loses grip and the car oversteers.
- **Proposed setup:** a front/total brake distribution of **0.69** keeps the car neutral-steering under braking.

## Task 5 – Driving Simulator (CASTER)
- **Model validation session:** logged the maximum longitudinal acceleration, lateral acceleration and yaw rate for three test cases. The results matched the instructor's reference values closely.
- **Simulator drive session:**
  - **Steady-state skid-pad:** with an 80/20 weight distribution the car understeered with heavy steering. With 20/80 it oversteered and left the track at higher speed.
  - **Braking into a curve from 90 km/h:** a 57/43 brake bias felt stable and realistic. 80/20 caused strong understeer, and 20/80 made the car spin.
- **Log data analysis:** plotted steering angle against lateral acceleration and the vehicle path from the skid-pad and brake test logs. The path plots confirm understeer (80/20) and oversteer (20/80).

## Files
| File | Description |
|------|-------------|
| [`DesignTask2Handout.slx`](DesignTask2Handout.slx) | **Main Simulink model.** Single-track model with lateral slip equations, load transfer block, roll stiffness and brake distribution |
| [`CasterBicycleModel_3.slx`](CasterBicycleModel_3.slx) | Bicycle model prepared for the CASTER driving simulator (with engine, driveline, brake system and longitudinal slip) |
| [`InitModel.m`](InitModel.m) | Vehicle parameters and scenario settings (speed, steering wheel angle, brake demand, CoG position, roll stiffness and brake distribution) |
| [`DrawPath.m`](DrawPath.m) | Post-processing: plots vehicle states, axle forces, slip angles and wheel loads, and animates the vehicle path |
| [`Task_1.m`](Task_1.m) | Steady-state cornering derivation, understeer gradient, critical/characteristic speed and steering angle (Task 1), plus plots of the simulator logs (Task 5) |
| `Group_5_braket1.mat` – `Group_5_braket3.mat` | Logged data from the three simulator brake tests |
| `Group_5_Skidpadt1.mat`, `Group_5_Skidpadt2.mat` | Logged data from the two simulator skid-pad tests |

The Simulink model templates, `InitModel.m` and `DrawPath.m` were provided by the course. Our group's work is the derivations and `Task_1.m`, the model implementation (slip, load transfer and combined slip), the parameter tuning, the simulator sessions and the analysis.

## How to run
1. Open this folder in MATLAB. All files must be in the same folder.
2. **Task 1:** run `Task_1.m` section by section. The first sections print the steady-state results and plot steering angle against speed. The later sections plot the simulator log data.
3. **Simulink model (Tasks 2–4):**
   1. Run `InitModel.m` to load the vehicle data and scenario settings.
   2. Open `DesignTask2Handout.slx` and press **Run**.
   3. Run `DrawPath.m` to plot the results and animate the vehicle path.

   Change the scenario in `InitModel.m`, for example `vehicleData.lf` (load case), `vx0` (speed), `SWA` (steering wheel angle), `vehicleData.pRollDist` (roll stiffness distribution) or `vehicleData.brakeDist` (brake distribution).

## Key Skills
`Lateral vehicle dynamics` · `Single-track (bicycle) model` · `Understeer gradient` · `Lateral load transfer` · `Roll stiffness distribution` · `Combined tyre slip` · `Brake force distribution` · `Driving simulator testing` · `MATLAB/Simulink`
