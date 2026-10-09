# Design Task 1 – Longitudinal Vehicle Dynamics & Traction Control

**Course:** MMF062 Vehicle Motion Engineering
**Authors:** George Vasanth Fransua S, Ramkumar Huleppa Munavalli (Group 5)
**Date:** November 2024
**Tools:** MATLAB (incl. Symbolic Math Toolbox)

📄 [Full report (PDF)](MMF062_VME_DesignTask1_Group5.pdf)

---

## Overview
This project models and simulates the longitudinal dynamics of an electric vehicle with independent front and rear motors. It covers tyre modelling with the Magic Formula, a full vehicle model with load transfer and road gradient, a comparison of AWD, FWD and RWD on an 8° uphill slope, and the effect of traction control (TC) on wheel slip and battery power.

### Vehicle data
The vehicle is based on a **Saab 9-3 Sedan** with an electrified dual-motor driveline (motor data from the Polestar 2 Dual Motor):

| Parameter | Value |
|-----------|-------|
| Curb weight | 1675 kg |
| Wheelbase / CoG height | 2.675 m / 0.343 m |
| Weight distribution (CoG to front axle) | 45 % of wheelbase |
| Drag coefficient / frontal area | 0.30 / 2.17 m² |
| Wheel radius | 0.316 m |
| Motors (front & rear) | 150 kW, 330 Nm each |
| Gear ratio | 8.57 (single speed) |

## Files
| File | Description |
|------|-------------|
| [`Simulation_main.m`](Simulation_main.m) | **Main script.** Time-step simulation (Euler, dt = 0.1 ms, 20 s) with traction control, results plots and battery power (Task 3 & 4) |
| [`Task1.m`](Task1.m) | Magic Formula curves for dry/wet/ice and fitting to experimental tyre data (Task 1) |
| [`Task2.m`](Task2.m) | Symbolic derivation of the vehicle model on a slope, solving for v̇, Fzf, Fzr, ω̇f, ω̇r (Task 2) |
| [`Sub_vehicle_dynamics.m`](Sub_vehicle_dynamics.m) | Vehicle model: acceleration, wheel angular accelerations and axle normal loads |
| [`Sub_wheel_slip.m`](Sub_wheel_slip.m) | Longitudinal slip definition, s = (ωR − v)/(ωR) |
| [`Sub_magic_tireformula.m`](Sub_magic_tireformula.m) | Pacejka Magic Formula friction for dry, wet and ice |
| [`Sub_drivetrain.m`](Sub_drivetrain.m) | Motor torque-speed map (constant torque + field weakening) and FWD/RWD/AWD torque split |
| [`Sub_read_data.m`](Sub_read_data.m) | Loads vehicle parameters into the `CONST` struct |
| [`Saab_93_datasheet.m`](Saab_93_datasheet.m) | Vehicle, tyre and driveline parameters |
| [`Sub_plot.m`](Sub_plot.m) | Plots distance, speed, acceleration, motor speed, normal loads, torques and slip |

The simulation framework and vehicle datasheet were provided by the course. Our group's work is the tyre analysis (`Task1.m`), the model derivation (`Task2.m`), the slip and vehicle dynamics functions, the simulation studies and the battery power analysis.

## How to run
1. Clone or download this folder and open it in MATLAB. All files must be in the same folder.
2. **Task 1:** run `Task1.m` to plot the tyre curves and the experimental fits.
3. **Task 2:** run `Task2.m` to print the symbolic solution of the vehicle equations. This needs the Symbolic Math Toolbox.
4. **Task 3 & 4:** in `Simulation_main.m`, set the scenario, then run it:
   ```matlab
   CONST.drive_mode = 1;   % 0 = RWD, 1 = FWD, 2 = AWD
   roadCondition    = 1;   % 1 = dry, 2 = wet, 3 = ice
   slope = 8*pi/180;       % road gradient [rad]
   ```
   The script plots the vehicle states, wheel loads, torques and slip, and the battery power. Battery power assumes 85 % drivetrain efficiency.

## Task 1 – Tyre Characteristics on Different Road Surfaces
- Plotted normalised longitudinal force against slip with the **Pacejka Magic Formula** for **dry, wet and ice** surfaces. Peak utilised friction was about 1.0 (dry), 0.6 (wet) and 0.1 (ice).
- Fitted the Magic Formula parameters (C, D) to two experimental tyre datasets:

| Dataset | E | C | D |
|---------|---|---|---|
| 1 (slip 0–0.45) | 0 | 2.75 | 0.94 |
| 1 (slip 0–0.45) | −4.0 | 1.50 | 0.94 |
| 2 (slip 0.5–0.95) | 0 | 1.60 | 0.85 |
| 2 (slip 0.5–0.95) | −4.0 | 1.55 | 0.99 |

## Task 2 – Vehicle Model
Derived a physical model of the vehicle, with free-body diagrams of the body and both wheels, including aerodynamic lift and drag, rolling resistance and wheel inertia. The model was then extended for road gradient θ:

$$M\dot{v} = F_{fx} + F_{rx} - R_{air} - Mg\sin\theta$$

$$F_{fz} + F_{air,fz} + F_{rz} + F_{air,rz} = Mg\cos\theta$$

$$(F_{rz} + F_{air,rz})L = M\dot{v}h + Mg\cos\theta\, l_f + R_{air}h + Mg\sin\theta\, h$$

$$T_i - F_{ix}R_i - F_{iz}\,RRC\,R_i = J_w\dot{\omega}_i \quad (i = f, r)$$

## Task 3 – Simulation of Longitudinal Dynamics
- Implemented the wheel-slip definition and the equations of motion in MATLAB and simulated a 20 s launch on an **8° dry incline**.
- Compared **AWD, FWD and RWD**: distance, speed, acceleration, motor speeds, axle normal loads, wheel torques and slip.
  - AWD covered the most distance (~800 m in 20 s) and reached the highest speed.
  - FWD and RWD gave similar distance (~450 m). Only the driven axle saw torque and slip.
- Compared the time to cover **100 m**:

| Drive mode | Dry | Wet |
|------------|-----|-----|
| RWD | 7.823 s | 12.179 s |
| FWD | 8.025 s | 11.532 s |

**Decision:** FWD was chosen because of the high chance of rain. It is 0.65 s faster in the wet, while RWD is only 0.2 s faster in the dry.

## Task 4 – Power Consumption With and Without Traction Control
- Simulated battery power for the front and rear motors with TC enabled:

| Configuration | Time to reach peak power |
|---------------|--------------------------|
| FWD, dry | ~4.2 s |
| RWD, dry | ~3.9 s |
| FWD, wet | ~14.7 s |
| RWD, wet | ~17.6 s |

- **TC logic:** TC switches on when wheel slip exceeds the optimal slip (the peak of the Magic Formula curve). It then limits the drive torque to the axle's friction limit, `Fz·(μmax + f_r)·R`, which is updated every time step from the current normal load.
- **Without TC**, the wheel spins at high slip and peak power is reached almost instantly (~0.08 s). With TC, slip is controlled and torque ramps up gradually.

## Key Skills
`Vehicle dynamics` · `Pacejka Magic Formula` · `Tyre parameter fitting` · `Load transfer` · `Traction control` · `Drivetrain comparison (AWD/FWD/RWD)` · `Electric motor torque-speed map` · `MATLAB` · `Symbolic Math Toolbox`
